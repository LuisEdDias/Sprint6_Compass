# Faz um print da tela caso um teste falhe e anexa no relatório
After() do |scenario|
    if scenario.failed?
        screenshot = Capybara.page.save_screenshot "reports/screenshots/sc.png"
        attach(screenshot, 'image/png')
    end
end
