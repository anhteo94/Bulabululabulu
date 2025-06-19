repeat wait() until game:IsLoaded()

-- Hiển thị thông báo khởi động
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Phạm Nghĩa IOS",
    Text = "Đang khởi chạy script, vui lòng đợi...",
    Duration = 3
})

-- Load script Min Gaming gốc
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinXoE"))()
end)

-- Cảnh báo nếu tải lỗi
if not success then
    warn("Không thể tải script gốc Min Gaming:", err)
end

-- Tùy biến giao diện sau khi tải GUI xong
spawn(function()
    wait(5)
    local ui = game:GetService("CoreGui"):FindFirstChildWhichIsA("ScreenGui", true)
    if ui then
        -- Đổi tất cả TextLabel chứa chữ Min Gaming thành Phạm Nghĩa IOS
        for _, label in ipairs(ui:GetDescendants()) do
            if label:IsA("TextLabel") and label.Text:find("Min") then
                label.Text = label.Text:gsub("Min Gaming", "Phạm Nghĩa IOS")
            end
        end

        -- Đổi toàn bộ ảnh trong menu thành ảnh Obito
        for _, image in ipairs(ui:GetDescendants()) do
            if image:IsA("ImageLabel") then
                image.Image = "https://i.imgur.com/JrgPMTO.jpeg"
            end
        end
    end
end)
