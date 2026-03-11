local player = game.Players.LocalPlayer

function createESP(model)
    if model:FindFirstChild("ESP") then return end

    local head = model:FindFirstChild("Head")
    if not head then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP"
    billboard.Size = UDim2.new(0,100,0,40)
    billboard.AlwaysOnTop = true
    billboard.Parent = head

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.Text = "NPC"
    text.TextColor3 = Color3.new(1,0,0)
    text.TextStrokeTransparency = 0
    text.Parent = billboard
end

while true do
    for _,v in pairs(workspace:GetDescendants()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("Head") then
            if not game.Players:GetPlayerFromCharacter(v) then
                createESP(v)
            end
        end
    end
    task.wait(2)
end
