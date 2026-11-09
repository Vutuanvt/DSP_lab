// Run once per Scilab session: exec("ipcv_init.sce");
// Flatpak Scilab has no help module -> stub help functions so IPCV can load
if ~isdef("add_help_chapter") then
    function add_help_chapter(varargin), endfunction
end
if ~isdef("helpbrowser_update") then
    function helpbrowser_update(varargin), endfunction
end

if ~isdef("imread") then
    atomsLoad("IPCV");
end
mprintf("IPCV ready: imread=%d imshow=%d rgb2gray=%d\n", ..
    isdef("imread"), isdef("imshow"), isdef("rgb2gray"));
