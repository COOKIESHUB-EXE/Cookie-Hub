-- Load UI Library (Rayfield)
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "🍪 Cookie Hub DR",
   Icon = 0,
   LoadingTitle = "Loading, please wait...",
   LoadingSubtitle = "by Cookie Hub Devs",
   Theme = "Default",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "CookieHubDR"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
})

-- **Tab Utama**
local MainTab = Window:CreateTab("Main", 124714113910876)
local MainSection = MainTab:CreateSection("Main Features")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- **Auto Fuel (Bahan Bakar Tanpa Habis)**
MainTab:CreateToggle({
   Name = "Infinite Fuel",
   Callback = function(v)
      _G.InfiniteFuel = v
      while _G.InfiniteFuel do
         local Train = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Train")
         if Train and Train:FindFirstChild("Fuel") then
            Train.Fuel.Value = 9999999 -- Set bahan bakar penuh
         end
         task.wait(1)
      end
   end
})

-- **Kill Musuh Dalam Radius 5km**
MainTab:CreateToggle({
   Name = "Kill All Enemies (5KM)",
   Callback = function(v)
      _G.KillNear = v
      while _G.KillNear do
         for _, enemy in pairs(Players:GetPlayers()) do
            if enemy ~= LocalPlayer and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
               local distance = (LocalPlayer.Character.HumanoidRootPart.Position - enemy.Character.HumanoidRootPart.Position).Magnitude
               if distance <= 5000 then -- 5KM = 5000 studs
                  if enemy.Character:FindFirstChild("Humanoid") then
                     enemy.Character.Humanoid.Health = 0 -- Kill target
                  end
               end
            end
         end
         task.wait(0.5)
      end
   end
})

-- **Auto Damage 100 dan Kecepatan Serangan Cepat**
MainTab:CreateToggle({
   Name = "Weapon Damage 100 & Fast Attack",
   Callback = function(v)
      _G.WeaponMod = v
      while _G.WeaponMod do
         for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("AttackSpeed") and tool:FindFirstChild("Damage") then
               tool.Damage.Value = 100 -- Ganti damage jadi 100
               tool.AttackSpeed.Value = 0.1 -- Kecepatan serangan tinggi
            end
         end
         task.wait(1)
      end
   end
})

-- **Auto Dapat Senjata & Jual Loot**
MainTab:CreateToggle({
   Name = "Auto Get Weapon & Sell Loot",
   Callback = function(v)
      _G.AutoLoot = v
      while _G.AutoLoot do
         local ShopEvent = ReplicatedStorage:FindFirstChild("SellAll")
         if ShopEvent then
            ShopEvent:InvokeServer() -- Jual semua barang
         end
         task.wait(5)
      end
   end
})

-- **Memaksa Uang Jadi 3999**
MainTab:CreateButton({
   Name = "Force Money to 3999",
   Callback = function()
      local Money = LocalPlayer:FindFirstChild("Money")
      if Money then
         Money.Value = 3999 -- Paksa jumlah uang jadi 3999
      end
   end
})

-- **Auto Farm Win**
MainTab:CreateToggle({
   Name = "Auto Farm Win",
   Callback = function(v)
      _G.FarmWin = v
      while _G.FarmWin do
         local Train = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Train")
         if Train then
            Train.Position = Vector3.new(80000, 10, 0) -- Teleport kereta ke garis finish 80KM
         end
         task.wait(5)
      end
   end
})

-- **Teks Rekomendasi**
local InfoTab = Window:CreateTab("Info", 124714113910876)
local InfoSection = InfoTab:CreateSection("Important Notice")

InfoTab:CreateLabel("⚠️ Recommended to use in Private Server & Play Solo! ⚠️")

Rayfield:Notify({
   Title = "⚠️ Warning!",
   Content = "Using this in public servers may get you banned!",
   Duration = 6.5
})
