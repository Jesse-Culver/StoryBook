GM.Name = "Story Book"
GM.Author = "Wazanator"
GM.Email = "wazanator01@gmail.com"
GM.Website = "https://gitlab.com/jesseculver/StoryBook"

//Disable NoClip
hook.Add("PlayerNoClip", "DisableNoClip", function()
    return false
end)
