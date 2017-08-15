xui.Class('App', 'xui.Module',{
    Instance:{
        iniComponents:function(){
            // [[Code created by CrossUI RAD Studio
            var host=this, children=[], append=function(child){children.push(child.get(0));};

            append(
                (new xui.UI.Group())
                .setHost(host,"group2")
                .setLeft(360)
                .setTop(20)
                .setWidth(330)
                .setHeight(260)
                .setCaption("xui.UI.CheckBox")
                .setToggleBtn(false)
            );

            host.group2.append(
                (new xui.UI.CheckBox())
                .setHost(host,"checkbox5")
                .setLeft(30)
                .setTop(50)
                .setWidth(250)
                .setHeight(30)
                .setCaption("an advanced checkbox with image")
                .setImage("{/}img/accept.png")
                );

            host.group2.append(
                (new xui.UI.CheckBox())
                .setHost(host,"checkbox4")
                .setLeft(30)
                .setTop(90)
                .setWidth(250)
                .setHeight(30)
                .setCaption("with shadow")
                );

            host.group2.append(
                (new xui.UI.CheckBox())
                .setHost(host,"checkbox1")
                .setLeft(30)
                .setTop(190)
                .setWidth(250)
                .setCaption("Cant check me")
                .beforeUIValueSet([{
                    "desc" : "action1",
                    "type" : "other",
                    "target" : "msg",
                    "params" : ["Return [false] can stop [before] event","",200,5000],
                    "method" : "message",
                    "return" : false
                }])
                );

            host.group2.append(
                (new xui.UI.CheckBox())
                .setHost(host,"checkbox3")
                .setLeft(30)
                .setTop(140)
                .setWidth(250)
                .setHeight(27)
                .setCaption("Right Alignment")
                );

            host.group2.append(
                (new xui.UI.CheckBox())
                .setHost(host,"checkbox2")
                .setLeft(30)
                .setTop(10)
                .setWidth(250)
                .setHeight(27)
                .setCaption("an advanced checkbox with border")
                );

            append(
                (new xui.UI.Group())
                .setHost(host,"group1")
                .setLeft(50)
                .setTop(20)
                .setWidth(290)
                .setHeight(260)
                .setCaption("xui.UI.SCheckBox (recommended)")
                .setToggleBtn(false)
            );

            host.group1.append(
                (new xui.UI.SCheckBox())
                .setHost(host,"scheckbox1")
                .setLeft(30)
                .setTop(20)
                .setCaption("a simple checkbox ")
                );

            host.group1.append(
                (new xui.UI.SCheckBox())
                .setHost(host,"ctl_scheckbox9")
                .setLeft(30)
                .setTop(50)
                .setImage("{/}img/accept.png")
                .setCaption("with image")
                );

            host.group1.append(
                (new xui.UI.SCheckBox())
                .setHost(host,"checkbox6")
                .setLeft(20)
                .setTop(200)
                .setWidth(250)
                .setHeight(30)
                .setCaption("Click me to check/uncheck all")
                .onChange("_checkbox6_onchange")
                );

            host.group1.append(
                (new xui.UI.Button())
                .setHost(host,"ctl_button33")
                .setLeft(20)
                .setTop(140)
                .setCaption("Status Button")
                .setType("status")
                );

            return children;
            // ]]Code created by CrossUI RAD Studio
        },
        _checkbox6_onchange:function (profile, oldValue, newValue, force, tag){
            xui.UI.SCheckBox.getAll().setValue(newValue);
            xui.UI.CheckBox.getAll().setValue(newValue);
            xui.UI.Button.getAll().setValue(newValue);
        }
    }
});