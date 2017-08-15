xui.Class('App', 'xui.Module',{
    Instance:{
        iniComponents:function(){
            // [[Code created by CrossUI RAD Studio
            var host=this, children=[], append=function(child){children.push(child.get(0));};

            append(
                (new xui.UI.Block())
                .setHost(host,"block1")
                .setLeft(40)
                .setTop(20)
                .setWidth(520)
                .setHeight(120)
                .setResizer(true)
                .setBorderType("inset")
            );

            host.block1.append(
                (new xui.UI.MenuBar())
                .setHost(host,"menubar1")
                .setItems([{
                    "id" : "file",
                    "caption" : "File",
                    "sub" : [{
                        "id" : "newproject",
                        "caption" : "New Project",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-32px top"
                    },{
                        "id" : "openproject",
                        "caption" : "Open Project",
                        "add" : "Ctrl+Alt+O",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-48px top"
                    },{
                        "id" : "closeproject",
                        "caption" : "Close Project"
                    },{
                        "id" : "s11",
                        "type" : "split"
                    },{
                        "id" : "save",
                        "caption" : "Save",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-80px top"
                    },{
                        "id" : "saveall",
                        "caption" : "Save All",
                        "add" : "Ctrl+Alt+S",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-96px top"
                    }]
                },{
                    "id" : "tools",
                    "caption" : "Tools",
                    "sub" : [{
                        "id" : "command",
                        "caption" : "Command Window",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-112px top"
                    },{
                        "id" : "spy",
                        "caption" : "Components Spy",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-128px top"
                    }]
                },{
                    "id" : "build",
                    "caption" : "Build",
                    "sub" : [{
                        "id" : "debug",
                        "caption" : "Debug",
                        "add" : "F9",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "top left"
                    },{
                        "id" : "release",
                        "caption" : "Release",
                        "add" : "Ctrl+F9",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-64px top"
                    },{
                        "id" : "s31",
                        "type" : "split"
                    },{
                        "id" : "setting",
                        "caption" : "Build Setting"
                    }]
                },{
                    "id" : "help",
                    "caption" : "Help",
                    "sub" : [{
                        "id" : "Forum",
                        "caption" : "forum"
                    },{
                        "id" : "s41",
                        "type" : "split"
                    },{
                        "id" : "License",
                        "caption" : "License"
                    },{
                        "id" : "s42",
                        "type" : "split"
                    },{
                        "id" : "about",
                        "caption" : "About"
                    }]
                },{
                    "id" : "tips",
                    "caption" : "[Click to pop menu]",
                    "disabled" : true
                }])
                .setAutoShowTime(0)
                .onMenuSelected("_menubar1_onmenuselected")
                );

            host.block1.append(
                (new xui.UI.Button())
                .setHost(host,"button3")
                .setLeft(360)
                .setTop(60)
                .setCaption("Pop Menu3")
                .onClick("_button3_onclick")
                );

            host.block1.append(
                (new xui.UI.Button())
                .setHost(host,"button2")
                .setLeft(190)
                .setTop(60)
                .setCaption("Pop menu2")
                .onClick("_button2_onclick")
                );

            host.block1.append(
                (new xui.UI.Button())
                .setHost(host,"button1")
                .setLeft(30)
                .setTop(60)
                .setCaption("Pop menu 1")
                .onClick("_button1_onclick")
                );

            host.block1.append(
                (new xui.UI.ToolBar())
                .setHost(host,"ctl_toolbar13")
                .setItems([{
                    "id" : "grp1",
                    "sub" : [{
                        "id" : "a1",
                        "caption" : "button"
                    },{
                        "id" : "a2",
                        "type" : "split"
                    },{
                        "id" : "a3",
                        "caption" : "drop button",
                        "type" : "dropButton"
                    },{
                        "id" : "a4",
                        "caption" : "status button",
                        "type" : "statusButton"
                    }],
                    "caption" : "grp1"
                },{
                    "id" : "grp2",
                    "sub" : [{
                        "id" : "b1",
                        "caption" : "",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-32px top"
                    },{
                        "id" : "b2",
                        "caption" : "image button",
                        "label" : "label:",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-32px -16px"
                    }],
                    "caption" : "grp2"
                }])
                .onClick("_ctl_toolbar13_onclick")
                );

            append(
                (new xui.UI.Block())
                .setHost(host,"block26")
                .setLeft(40)
                .setTop(160)
                .setWidth(520)
                .setHeight(120)
                .setResizer(true)
                .setBorderType("inset")
            );

            host.block26.append(
                (new xui.UI.MenuBar())
                .setHost(host,"menubar5")
                .setItems([{
                    "id" : "file",
                    "caption" : "File",
                    "sub" : [{
                        "id" : "newproject",
                        "caption" : "New Project",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-32px top"
                    },{
                        "id" : "openproject",
                        "caption" : "Open Project",
                        "add" : "Ctrl+Alt+O",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-48px top"
                    },{
                        "id" : "closeproject",
                        "caption" : "Close Project"
                    },{
                        "id" : "s11",
                        "type" : "split"
                    },{
                        "id" : "save",
                        "caption" : "Save",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-80px top"
                    },{
                        "id" : "saveall",
                        "caption" : "Save All",
                        "add" : "Ctrl+Alt+S",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-96px top"
                    }]
                },{
                    "id" : "tools",
                    "caption" : "Tools",
                    "sub" : [{
                        "id" : "command",
                        "caption" : "Command Window",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-112px top"
                    },{
                        "id" : "spy",
                        "caption" : "Components Spy",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-128px top"
                    }]
                },{
                    "id" : "build",
                    "caption" : "Build",
                    "sub" : [{
                        "id" : "debug",
                        "caption" : "Debug",
                        "add" : "F9",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "top left"
                    },{
                        "id" : "release",
                        "caption" : "Release",
                        "add" : "Ctrl+F9",
                        "image" : "{/}img/App.gif",
                        "imagePos" : "-64px top"
                    },{
                        "id" : "s31",
                        "type" : "split"
                    },{
                        "id" : "setting",
                        "caption" : "Build Setting"
                    }]
                },{
                    "id" : "help",
                    "caption" : "Help",
                    "sub" : [{
                        "id" : "Forum",
                        "caption" : "forum"
                    },{
                        "id" : "s41",
                        "type" : "split"
                    },{
                        "id" : "License",
                        "caption" : "License"
                    },{
                        "id" : "s42",
                        "type" : "split"
                    },{
                        "id" : "about",
                        "caption" : "About"
                    }]
                },{
                    "id" : "tips",
                    "caption" : "[Hover to pop menu]",
                    "disabled" : true
                }])
                .onMenuSelected("_menubar1_onmenuselected")
                );

            host.block26.append(
                (new xui.UI.Button())
                .setHost(host,"ctl_button22")
                .setHoverPop("popmenu2")
                .setLeft(360)
                .setTop(60)
                .setCaption("Pop Menu3")
                .beforeHoverEffect("_ctl_button22_beforehovereffect")
                );

            host.block26.append(
                (new xui.UI.Button())
                .setHost(host,"ctl_button23")
                .setHoverPop("popmenu1")
                .setLeft(190)
                .setTop(60)
                .setCaption("Pop menu2")
                .beforeHoverEffect("_ctl_button23_beforehovereffect")
                );

            host.block26.append(
                (new xui.UI.Button())
                .setHost(host,"ctl_button24")
                .setHoverPop("popmenu1")
                .setLeft(30)
                .setTop(60)
                .setCaption("Pop menu 1")
                .beforeHoverEffect("_ctl_button24_beforehovereffect")
                );

            append(
                (new xui.UI.PopMenu())
                .setHost(host,"popmenu1")
                .setItems([{
                    "id" : "itema",
                    "caption" : "itema",
                    "image" : "{/}img/App.gif",
                    "imagePos" : "-32px top",
                    "tips" : "item a"
                },{
                    "id" : "ce",
                    "caption" : "ce",
                    "type" : "split"
                },{
                    "id" : "itemb",
                    "caption" : "itemb",
                    "type" : "checkbox",
                    "value" : true,
                    "tips" : "item b"
                },{
                    "id" : "itemc",
                    "caption" : "itemc",
                    "type" : "checkbox",
                    "tips" : "item c"
                },{
                    "id" : "itemd",
                    "caption" : "itemd",
                    "tips" : "item d"
                },{
                    "id" : "iteme",
                    "caption" : "iteme",
                    "type" : "radiobox",
                    "value" : true,
                    "tips" : "item e"
                },{
                    "id" : "itemf",
                    "caption" : "itemf",
                    "type" : "radiobox",
                    "tips" : "item f"
                }])
                .setWidth(82)
                .setHeight(132)
                .setShadow(false)
                .onMenuSelected("_popmenu1_onmenuselected")
            );

            append(
                (new xui.UI.PopMenu())
                .setHost(host,"popmenu2")
                .setItems([{
                    "id" : "itema",
                    "caption" : "itema",
                    "image" : "{/}img/App.gif",
                    "imagePos" : "-32px top",
                    "tips" : "item a"
                },{
                    "id" : "itemb",
                    "caption" : "itemb",
                    "tips" : "item b",
                    "sub" : [{
                        "id" : "itema1",
                        "caption" : "itema",
                        "tips" : "item a"
                    },{
                        "id" : "itemb1",
                        "caption" : "itemb",
                        "tips" : "item b",
                        "sub" : [{
                            "id" : "itemc11",
                            "caption" : "itemc",
                            "tips" : "item c"
                        },{
                            "id" : "itemd11",
                            "caption" : "itemd",
                            "tips" : "item d"
                        }]
                    },{
                        "id" : "itemc1",
                        "caption" : "itemc",
                        "tips" : "item c"
                    },{
                        "id" : "itemd1",
                        "caption" : "itemd",
                        "tips" : "item d",
                        "sub" : [{
                            "id" : "itemc11",
                            "caption" : "itemc",
                            "tips" : "item c"
                        },{
                            "id" : "itemd11",
                            "caption" : "itemd",
                            "tips" : "item d"
                        }]
                    }]
                },{
                    "id" : "itemc",
                    "caption" : "itemc",
                    "tips" : "item c"
                },{
                    "id" : "itemd",
                    "caption" : "itemd",
                    "tips" : "item d"
                },{
                    "id" : "iteme",
                    "caption" : "iteme"
                },{
                    "id" : "itemf",
                    "caption" : "itemf"
                },{
                    "id" : "itemg",
                    "caption" : "itemg"
                },{
                    "id" : "itemh",
                    "caption" : "itemh"
                },{
                    "id" : "itemi",
                    "caption" : "itemi"
                },{
                    "id" : "itemj",
                    "caption" : "itemj"
                },{
                    "id" : "itemk",
                    "caption" : "itemk"
                },{
                    "id" : "iteml",
                    "caption" : "iteml"
                },{
                    "id" : "itemm",
                    "caption" : "itemm"
                },{
                    "id" : "itemn",
                    "caption" : "itemn"
                },{
                    "id" : "itemo",
                    "caption" : "itemo"
                },{
                    "id" : "itemp",
                    "caption" : "itemp"
                }])
                .setWidth(86)
                .setHeight(262)
                .onMenuSelected("_popmenu2_onmenuselected")
            );

            return children;
            // ]]Code created by CrossUI RAD Studio
        },
        _menubar1_onmenuselected:function (profile, popPro, item, src) {
            xui.message(item.id+' was selected.');
        },
        _button1_onclick:function (profile, e, value) {
            this.popmenu1.pop(profile);
            this.popmenu1.setTagVar({hoverFrom:[profile]});
        },
        _button2_onclick:function (profile, e, value) {
            this.popmenu1.pop(profile.getRoot(),"outerright-top");
            this.popmenu1.setTagVar({hoverFrom:[profile]});
        },
        _button3_onclick:function (profile, e, value) {
            this.popmenu2.pop(profile.getRoot(),"left-top");
            this.popmenu2.setTagVar({hoverFrom:[profile]});
        },
        _popmenu1_onmenuselected:function (profile,  item, src) {
            var tagVar=this.popmenu1.getTagVar();
            if(tagVar.hoverFrom)
                tagVar.hoverFrom[0].boxing().setCaption(item.id);
            xui.message(item.id+' clicked');
        },
        _popmenu2_onmenuselected:function (profile,  item, src) {
            var tagVar=this.popmenu2.getTagVar();
            if(tagVar.hoverFrom)
                tagVar.hoverFrom[0].boxing().setCaption(item.id);
            xui.message(item.id+' clicked');
        },
        _ctl_toolbar13_onclick:function (profile, item, group, e, src){
            switch(item.id){
                case "a1":
                case "b2":
                case "a4":
                    xui.message("You clicked "+ item.caption);
                    break;
                case "a3":
                    this.popmenu1.pop(src);
                    this.popmenu1.setTagVar({hoverFrom:null});
                    break;
                default:

            }
        }
    }
});