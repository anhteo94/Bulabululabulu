local Settings = {
    JoinTeam = "Pirates";    -- Pirates/Marines
    Translator = true;       -- true/false
}

-- Hiển thị thông báo loading nhẹ
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Phạm Nghĩa IOS",
    Text = "Đang tải script...",
    Duration = 3
})

-- Load script gốc của Redz, giữ nguyên tính năng
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
end)
if not success then
    warn("Không thể tải script gốc:", err)
end

-- Sau khi giao diện Redz load xong, mình sẽ chỉnh giao diện hiển thị
spawn(function()
    wait(5)
    local ui = game.CoreGui:FindFirstChildWhichIsA("ScreenGui", true)
    if ui then
        -- Thay tên “Redz” hoặc logo thành “Phạm Nghĩa IOS”
        for _, lbl in ipairs(ui:GetDescendants()) do
            if (lbl:IsA("TextLabel") or lbl:IsA("TextButton")) and lbl.Text:find("Redz") then
                lbl.Text = lbl.Text:gsub("Redz", "Phạm Nghĩa IOS")
            end
        end
        -- Thay avatar ảnh nền/logo thành Obito
        for _, img in ipairs(ui:GetDescendants()) do
            if (img:IsA("ImageLabel") or img:IsA("ImageButton")) then
                img.Image = "https://i.imgur.com/JrgPMTO.jpeg"
            end
        end
    end
end)
