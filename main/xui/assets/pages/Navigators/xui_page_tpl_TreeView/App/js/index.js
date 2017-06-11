xui.Class('App', 'xui.Module',{
    Instance:{
        _treebar1_onitemselected:function (profile, item, src) {
            var value=profile.boxing().getUIValue();
            //for selMode='none'
            if(!value)value=item.id;
            xui.message(value + ' selected');
        },
        iniComponents:function(){
            // [[Code created by CrossUI RAD Studio
            var host=this, children=[], append=function(child){children.push(child.get(0));};

            append(
                (new xui.UI.Pane())
                .setHost(host,"panel2")
                .setLeft(280)
                .setTop(130)
                .setWidth(210)
                .setHeight(200)
            );

            host.panel2.append(
                (new xui.UI.TreeBar())
                .setHost(host,"treebar3")
                .setItems([{
                    "id" : "a",
                    "caption" : "itema",
                    "tips" : "item a",
                    "sub" : [{
                        "id" : "aa",
                        "caption" : "suba"
                    },{
                        "id" : "ab",
                        "caption" : "subb"
                    }]
                },{
                    "id" : "b",
                    "caption" : "itemb",
                    "tips" : "item b"
                },{
                    "id" : "c",
                    "caption" : "itemc",
                    "tips" : "item c"
                },{
                    "id" : "d",
                    "caption" : "itemd",
                    "tips" : "item d",
                    "group" : true,
                    "iniFold" : true,
                    "sub" : [{
                        "id" : "da",
                        "caption" : "suba"
                    },{
                        "id" : "db",
                        "caption" : "subb"
                    },{
                        "id" : "dc",
                        "caption" : "subc"
                    }]
                }])
                .setTabindex("5")
                .setIniFold(false)
                .onItemSelected("_treebar1_onitemselected")
                );

            append(
                (new xui.UI.Pane())
                .setHost(host,"panel3")
                .setLeft(280)
                .setTop(370)
                .setWidth(210)
                .setHeight(100)
            );

            host.panel3.append(
                (new xui.UI.TreeBar())
                .setHost(host,"treebar5")
                .setItems([{
                    "id" : "a",
                    "caption" : "itema",
                    "tips" : "item a",
                    "sub" : [{
                        "id" : "aa",
                        "caption" : "suba"
                    },{
                        "id" : "ab",
                        "caption" : "subb"
                    }]
                },{
                    "id" : "b",
                    "caption" : "itemb",
                    "tips" : "item b"
                },{
                    "id" : "c",
                    "caption" : "itemc",
                    "tips" : "item c"
                }])
                .onItemSelected("_treebar1_onitemselected")
                );

            append(
                (new xui.UI.Pane())
                .setHost(host,"panel1")
                .setLeft(280)
                .setTop(10)
                .setWidth(210)
                .setHeight(120)
            );

            host.panel1.append(
                (new xui.UI.TreeBar())
                .setHost(host,"treebar1")
                .setItems([{
                    "id" : "a",
                    "caption" : "itema",
                    "tips" : "item a",
                    "sub" : [{
                        "id" : "aa",
                        "caption" : "suba"
                    },{
                        "id" : "ab",
                        "caption" : "subb"
                    }]
                },{
                    "id" : "b",
                    "caption" : "itemb",
                    "tips" : "item b"
                },{
                    "id" : "c",
                    "caption" : "itemc",
                    "tips" : "item c"
                }])
                .setSelMode("none")
                .onItemSelected("_treebar1_onitemselected")
                );

            append(
                (new xui.UI.Panel())
                .setHost(host,"ctl_panel3")
                .setDock("none")
                .setLeft(520)
                .setTop(10)
                .setWidth(260)
                .setHeight(350)
                .setZIndex(1)
                .setCaption("TreeView Demo")
            );

            host.ctl_panel3.append(
                (new xui.UI.TreeView())
                .setHost(host,"ctl_treeview1")
                .setItems([{
                    "id" : "folder1",
                    "caption" : "folder1",
                    "image" : "{/}img/application_split.png",
                    "sub" : true
                },{
                    "id" : "folder2",
                    "caption" : "folder2",
                    "sub" : true
                },{
                    "id" : "file1",
                    "caption" : "file1"
                }])
                .setDropKeys("hihi")
                .setDragKey("hihi")
                .onGetContent("_ctl_treeview1_ongetcontent")
                .onItemSelected("_ctl_treeview1_onitemselected")
                .afterFold("_ctl_treeview1_afterfold")
                .afterExpand("_ctl_treeview1_afterexpand")
                );

            append(
                (new xui.UI.Block())
                .setHost(host,"block1")
                .setLeft(10)
                .setTop(10)
                .setWidth(250)
                .setHeight(160)
                .setResizer(true)
            );

            host.block1.append(
                (new xui.UI.TreeBar())
                .setHost(host,"treebar2")
                .setItems([{
                    "id" : "a",
                    "caption" : "itema",
                    "tips" : "item a",
                    "sub" : [{
                        "id" : "aa",
                        "caption" : "suba"
                    },{
                        "id" : "ab",
                        "caption" : "subb"
                    }]
                },{
                    "id" : "b",
                    "caption" : "itemb",
                    "image" : "{/}img/application_split.png",
                    "tips" : "item b"
                },{
                    "id" : "c",
                    "caption" : "itemc",
                    "tips" : "item c"
                }])
                .setGroup(true)
                .onItemSelected("_treebar1_onitemselected")
                );

            append(
                (new xui.UI.Block())
                .setHost(host,"block2")
                .setLeft(10)
                .setTop(200)
                .setWidth(250)
                .setHeight(160)
                .setResizer(true)
            );

            host.block2.append(
                (new xui.UI.TreeBar())
                .setHost(host,"treebar4")
                .setItems([{
                    "id" : "a",
                    "caption" : "itema",
                    "tips" : "item a",
                    "sub" : [{
                        "id" : "aa",
                        "caption" : "suba"
                    },{
                        "id" : "ab",
                        "caption" : "subb"
                    }]
                },{
                    "id" : "b",
                    "caption" : "itemb",
                    "tips" : "item b"
                },{
                    "id" : "c",
                    "caption" : "itemc",
                    "tips" : "item c"
                }])
                .setSelMode("multi")
                .setValue("")
                .onItemSelected("_treebar1_onitemselected")
                );

            return children;
            // ]]Code created by CrossUI RAD Studio
        },
        _ctl_treeview1_ongetcontent : function (profile, item, callback) {
            var id=item.id,tid="temp"+xui.stamp();
            var items=[];
            // two files
            items.push({id:'file_'+xui.id(), caption:'file_'+xui.id(),image:"{/}img/application_split.png"});
            items.push({id:'file_'+xui.id(), caption:'file_'+xui.id(),image:"{/}img/application_split.png"});
            // a folder
            items.push({id:id+'_1', caption:id+'_1', sub:true});
            items.push({id:id+'_2', caption:id+'_2', sub:true, image:"{/}img/application_split.png"});
            items.push({id:id+'_3', caption:id+'_3', sub:true});
            // add new sub items
            return items;
        },
        _ctl_treeview1_onitemselected : function (profile, item, src) {
            xui.message(item.id + " was selected!");
        },
        _ctl_treeview1_afterfold : function (profile, item) {
            xui.message(item.id + " is fold!");
        },
        _ctl_treeview1_afterexpand : function (profile, item) {
            xui.message(item.id + " is expand!");
        }
    }
});