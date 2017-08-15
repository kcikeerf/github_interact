xui.Class('App', 'xui.Module',{
    Instance:{
        iniComponents:function(){
            // [[Code created by CrossUI RAD Studio
            var host=this, children=[], append=function(child){children.push(child.get(0));};

            append(
                (new xui.UI.Div())
                .setHost(host,"divDemo")
                .setLeft(360)
                .setTop(80)
                .setWidth(60)
                .setHeight(60)
                .setHtml("Line 01<div>Line 02</div><div>Line 03</div><div>Line 04</div><div>Line 05</div><div>Line 06</div><div>Line 07<div>Line 08</div><div>Line 09</div><div>Line 10</div><div>Line 11</div><div>Line 12</div></div><div>Line 13<div>Line 14</div><div>Line 15</div><div>Line 16</div><div>Line 17</div><div>Line 18</div><div>Line 19</div><div>Line 20</div><div>Line 21</div><div>Line 22</div><div>Line 23</div></div><div>Line 24<div>Line 25</div><div>Line 26</div><div>Line 27</div><div>Line 28</div><div>Line 29</div></div><div>Line 30</div>")
                .setCustomStyle({
                    "KEY" : "border:solid 1px;background-color:#fff;overflow:auto;"
                })
            );

            append(
                (new xui.UI.SButton())
                .setHost(host,"sbutton3")
                .setLeft(528)
                .setTop(18)
                .setWidth(80)
                .setCaption("Go")
                .onClick("_sbutton3_onclick")
            );

            append(
                (new xui.UI.List())
                .setHost(host,"list2")
                .setShowDirtyMark(false)
                .setItems([{
                    "id" : "linear",
                    "caption" : "linear"
                },{
                    "id" : "quadIn",
                    "caption" : "quadIn"
                },{
                    "id" : "quadOut",
                    "caption" : "quadOut"
                },{
                    "id" : "quadInOut",
                    "caption" : "quadInOut"
                },{
                    "id" : "cubicIn",
                    "caption" : "cubicIn"
                },{
                    "id" : "cubicOut",
                    "caption" : "cubicOut"
                },{
                    "id" : "cubicInOut",
                    "caption" : "cubicInOut"
                },{
                    "id" : "easeIn",
                    "caption" : "easeIn"
                },{
                    "id" : "easeOut",
                    "caption" : "easeOut"
                },{
                    "id" : "easeInOut",
                    "caption" : "easeInOut"
                },{
                    "id" : "quartIn",
                    "caption" : "quartIn"
                },{
                    "id" : "quartOut",
                    "caption" : "quartOut"
                },{
                    "id" : "quartInOut",
                    "caption" : "quartInOut"
                },{
                    "id" : "quintIn",
                    "caption" : "quintIn"
                },{
                    "id" : "quintOut",
                    "caption" : "quintOut"
                },{
                    "id" : "quintInOut",
                    "caption" : "quintInOut"
                },{
                    "id" : "sineIn",
                    "caption" : "sineIn"
                },{
                    "id" : "sineOut",
                    "caption" : "sineOut"
                },{
                    "id" : "sineInOut",
                    "caption" : "sineInOut"
                },{
                    "id" : "expoIn",
                    "caption" : "expoIn"
                },{
                    "id" : "expoOut",
                    "caption" : "expoOut"
                },{
                    "id" : "expoInOut",
                    "caption" : "expoInOut"
                },{
                    "id" : "circIn",
                    "caption" : "circIn"
                },{
                    "id" : "circOut",
                    "caption" : "circOut"
                },{
                    "id" : "circInOut",
                    "caption" : "circInOut"
                },{
                    "id" : "bounceIn",
                    "caption" : "bounceIn"
                },{
                    "id" : "bounceOut",
                    "caption" : "bounceOut"
                },{
                    "id" : "bounceInOut",
                    "caption" : "bounceInOut"
                },{
                    "id" : "elasticIn",
                    "caption" : "elasticIn"
                },{
                    "id" : "elasticOut",
                    "caption" : "elasticOut"
                },{
                    "id" : "elasticInOut",
                    "caption" : "elasticInOut"
                }])
                .setLeft(38)
                .setTop(138)
                .setValue("")
                .onChange("_list2_onchange")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cWidth")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(8)
                .setHeight(22)
                .setCaption("width")
                .setValue(true)
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cHeight")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(28)
                .setHeight(22)
                .setCaption("height")
                .setValue(true)
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cLeft")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(48)
                .setHeight(22)
                .setCaption("left")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cTop")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(68)
                .setHeight(22)
                .setCaption("top")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cOpacity")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(88)
                .setHeight(22)
                .setCaption("opacity")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cBackgroundColor")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(108)
                .setHeight(22)
                .setCaption("backgroundColor")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cScrollTop")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(128)
                .setHeight(22)
                .setCaption("scrollTop")
            );

            append(
                (new xui.UI.Image())
                .setHost(host,"ctl_image8")
                .setLeft(38)
                .setTop(18)
                .setWidth(120)
                .setHeight(120)
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cRotate")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(148)
                .setHeight(22)
                .setCaption("rotate")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cReverse")
                .setDirtyMark(false)
                .setLeft(370)
                .setTop(18)
                .setCaption("reverse")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cscaleX")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(168)
                .setHeight(22)
                .setCaption("scaleX")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"ctranslateX")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(208)
                .setHeight(22)
                .setCaption("translateX")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cscaleY")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(188)
                .setHeight(22)
                .setCaption("scaleY")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cskewX")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(248)
                .setHeight(22)
                .setCaption("skewX")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"ctranslateY")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(228)
                .setHeight(22)
                .setCaption("translateY")
            );

            append(
                (new xui.UI.SCheckBox())
                .setHost(host,"cskewY")
                .setDirtyMark(false)
                .setShowDirtyMark(false)
                .setLeft(198)
                .setTop(268)
                .setHeight(22)
                .setCaption("skewY")
            );

            return children;
            // ]]Code created by CrossUI RAD Studio
        },
        _sbutton3_onclick:function (profile, e, src, value) {
            var ns=this, args={},type=ns.list2.getUIValue(),fun=function(){

                if(ns.cWidth.getUIValue())args.width=[60,300,'px'];
                if(ns.cHeight.getUIValue())args.height=[60,300,'px'];
                if(ns.cLeft.getUIValue())args.left=[360,460,'px'];
                if(ns.cTop.getUIValue())args.top=[100,300,'px'];
                if(ns.cOpacity.getUIValue())args.opacity=[1,0];
                if(ns.cBackgroundColor.getUIValue())args.backgroundColor=['#ffffff','#bbbbbb'];
                if(ns.cScrollTop.getUIValue())args.scrollTop=[0,100];
                if(ns.cRotate.getUIValue())args.rotate=[0,360];
                if(ns.cscaleX.getUIValue())args.scaleX=[1,5];
                if(ns.cscaleY.getUIValue())args.scaleY=[1,5];
                if(ns.ctranslateX.getUIValue())args.translateX=[0,200];
                if(ns.ctranslateY.getUIValue())args.translateY=[0,200];
                if(ns.cskewX.getUIValue())args.skewX=[0,180];
                if(ns.cskewY.getUIValue())args.skewY=[0,180];

                if(!xui.isEmpty(args) && type){
                    var args2={}, target = ns.divDemo,
                        node=target.getRoot();
                    xui.each(args,function(o,i){
                       args2[i]=[o[1],o[0],o[2]];
                    });
                    ns.sbutton3.setDisplay('none');
                    node.animate(args,null,function(){
                        if(ns.cReverse.getUIValue()){
                            xui.asyRun(function(){
                                node.animate(args2,null,function(){
                                    xui.asyRun(function(){
                                        ns.divDemo.refresh();
                                        ns.sbutton3.setDisplay("");
                                    },1000);
                                },300,0, type).start();
                            },500);
                        }else{
                            xui.asyRun(function(){
                                ns.divDemo.refresh();
                                ns.sbutton3.setDisplay("");
                            },1000);
                        }
                    },300,0,type).start();
                }
            };
            fun();
        },
        _list2_onchange:function (profile, oldValue, newValue){
            var ns = this;
            ns.ctl_image8.setSrc("{/}img/"+newValue+".gif");
        },
        events:{"onRender":"_com_onrender"},
        _com_onrender:function (com, threadid){
            this.list2.setUIValue("linear",true);
        }
    }
});