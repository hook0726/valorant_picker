require 'chrome_remote'
require 'nokogiri'
require_relative '../config/environment'

def wait_for_complete
    loop do
        sleep(1)
        response = @chrome.send_cmd 'Runtime.evaluate', expression: 'document.readyState;'
        break if response['result']['value'] == 'complete'
    end
end

def navigate_to_next_page(page_number)
    @chrome.send_cmd(
        "Runtime.evaluate",
        expression: <<~JS
            (function() {
                const buttons = document.querySelectorAll('a.btn.mod-page');
                for (const btn of buttons) {
                    if (btn.innerText.trim() == "#{page_number}") {
                        btn.click();
                        break;
                    }
                }
            })();
        JS
    )
    wait_for_complete
end

def storage_html(match_id)
    response = @chrome.send_cmd 'Runtime.evaluate', expression: 'document.documentElement.outerHTML'
    html =  response['result']['value']
    File.open(Rails.root.join("tmp", "match_result_html", "vlrgg_#{match_id}.html"), 'w') do |file|
        file.write(html)
    end
end

def get_all_result_links
    count_js = <<~JS
        document.querySelectorAll('a.wf-module-item').length
    JS
    puts count_js
    count = @chrome.send_cmd("Runtime.evaluate", expression: count_js)["result"]["value"]
    puts count
    Array.new(count) { |i| "a.wf-module-item[#{i}]" }
end

@chrome = ChromeRemote.client
@chrome.send_cmd 'Page.navigate', url: 'https://www.vlr.gg/matches/results'
wait_for_complete
page_number = 1
while(page_number < 50)
    result_links = get_all_result_links
    result_links.each_with_index do |link, result_index|
        href = @chrome.send_cmd("Runtime.evaluate", expression: "document.querySelectorAll('a.wf-module-item')[#{result_index}].href")
        match_id = href['result']['value'].match(/\/(\d+)\//)[1]

        #ファイルが既にあったら次のリンクへ
        folder_path = Rails.root.join("tmp", "match_result_html")
        file_name   = "vlrgg_#{match_id}.html"
        file_path   = File.join(folder_path, file_name)

        if File.exist?(file_path)
            puts "File already exists: #{file_path}"
            next
            
        end

        @chrome.send_cmd("Runtime.evaluate", expression: "document.querySelectorAll('a.wf-module-item')[#{result_index}].click()")
        wait_for_complete
        storage_html(match_id)
        @chrome.send_cmd("Runtime.evaluate", expression: "window.history.back()")
        wait_for_complete
    end
    navigate_to_next_page(page_number+1)
    page_number += 1
end

