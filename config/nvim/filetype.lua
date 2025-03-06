-- Only run this if filetypes haven't been loaded yet
if vim.g.did_load_filetypes then
  return
end

-- Define custom filetype detections
vim.filetype.add({
  pattern = {
    [".*%.bb"] = "clojure",
    ["Tiltfile"] = "python",
  },
  extension = {
    ncl = "nickel", -- Add Nickel filetype detection
  },
})
