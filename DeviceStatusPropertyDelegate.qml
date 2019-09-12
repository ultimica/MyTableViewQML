import QtQuick 2.0

Item {
    id:root
    property int rowid : styleData.row
    property int colid : styleData.column
    property bool islog :styleData.pressed
//    onIslogChanged:{
//        if(islog)
//        {
//        //logStyle(styleData)
//        if(model.qq)
//            console.log("MODELQQQ");
//        }
//    }

    height:loadqml.height
    
    Item{
        id:dummyctrl
        function dumFun()
        {
            console.log("GAGAGAGA");
        }
    }

    Rectangle{
        border.color : "#808080"
        color: "#00000000"
        anchors.fill : parent
        Loader {
            id:loadqml
            property var controler : dummyctrl
            anchors.fill : parent
            source : {
                switch(styleData.column)
                {
                   case 0 :
                        return "Properties_Key.qml";
                   case 1 :
                   {
                       return model.subcontrol;
                   }
//                    case 2 :
//                    {
//                        if(model!==null)
//                        {
//                      //  console.log("Current Model:"+model);
//                        if(model.iotype===StaticEnumClass.IOType_DI ||
//                           model.iotype===StaticEnumClass.IOType_DO)
//                            return "Monitor_Table_Cell_Data.qml";
//                        else
//                            return "Monitor_Table_Cell_EditData.qml";
//                        }
//                    }
                }
                return "";
            }
            focus : true
        }

    }
}
