# Type here! 

# Use this to customize the wymeditor boot process
# Just mirror the options specified in boot_wym.js with the new options here.
# This will completely override anything specified in boot_wym.js for that key.
# e.g. skin: 'something_else'
@custom_wymeditor_boot_options = {
  toolsItems: [
    name: "InsertUnorderedList"
    title: "Unordered_List"
    css: "wym_tools_unordered_list"
  ,
    name: "InsertOrderedList"
    title: "Ordered_List"
    css: "wym_tools_ordered_list"
  ,
    name: "CreateLink"
    title: "Link"
    css: "wym_tools_link"
  ,
    name: "Unlink"
    title: "Unlink"
    css: "wym_tools_unlink"
  ,
    name: "InsertImage"
    title: "Image"
    css: "wym_tools_image"
  ,
    name: "InsertTable"
    title: "Table"
    css: "wym_tools_table"
  ,
    name: "ToggleHtml"
    title: "HTML"
    css: "wym_tools_html"
  ]
  classesItems: [
    name: "text-align"
    rules: [
      name: "left"
      title: "{Left}"
    ,
      name: "center"
      title: "{Center}"
    ,
      name: "right"
      title: "{Right}"
    ,
      name: "justify"
      title: "{Justify}"
    ]
    join: "-"
    title: "{Text_Align}"
  ,
    name: "image-align"
    rules: [
      name: "left"
      title: "{Left}"
    ,
      name: "right"
      title: "{Right}"
    ]
    join: "-"
    title: "{Image_Align}"
  ,
    name: "font-size"
    rules: [
      name: "small"
      title: "{Small}"
    ,
      name: "normal"
      title: "{Normal}"
    ,
      name: "large"
      title: "{Large}"
    ]
    join: "-"
    title: "{Font_Size}"
  ,
    name: "font-style"
    rules: [
      name: "bold"
      title: "Pogrubienie"
    ]
    join: "-"
    title: "Pogrubienie"
  ,
    name: "font-style"
    rules: [
      name: "italic"
      title: "Pochylenie"
    ]
    join: "-"
    title: "Pochylenie"
  ,
    name: "font-style"
    rules: [
      name: "underline"
      title: "Podkreślenie"
    ]
    join: "-"
    title: "Podkreślenie"
  ]
}