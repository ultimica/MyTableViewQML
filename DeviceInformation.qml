import QtQuick 2.0
import QtQuick.Controls 1.4
import "singletons"

Item{
    id:item

    property alias monitormodel: tableinfo.tableModel
    property bool iscurrentShowTable : caption.isShowTable

    Item{
        id: normalRect
        anchors.fill : parent
    }

    Item{
        id: minimizeRect
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        height :30        
    }

    Rectangle {
        id:background
        anchors.fill : (iscurrentShowTable)?normalRect:minimizeRect
        color : DevStyle.colorSet.information_caption_bak_color
    }

    MouseArea{  ///block mouse interaction
        anchors.fill : background
        onWheel: {
            wheel.accepted=true;
        }
    }

    DeviceInformation_Caption{
        id:caption
        anchors.top:background.top
        anchors.right:background.right
        anchors.left:background.left
        height:minimizeRect.height
    }

    DeviceInfo_TabSwitch{
        id:devtabswitch
        anchors.top:caption.bottom
        anchors.left: background.left
        anchors.leftMargin:2
        anchors.right:background.right
        anchors.rightMargin:2
        height:25
    }




    Item{
        id: tablerect
        anchors.top : devtabswitch.bottom
        //anchors.topMargin : caption.height
        anchors.left: background.left
        anchors.leftMargin:2
        anchors.right:background.right
        anchors.rightMargin:2
        anchors.bottom : background.bottom   
        anchors.bottomMargin :2
    }

//    Loader{
//        id:subloader
//        anchors.fill : tablerect
//        property string dynamicqml :""
//        source:(devtabswitch.currentActive==0)?"TableviewExmple.qml":""
//        focus:true
//        scale:Coordinate.scale
//    }

    TableviewExmple{
        id:tableinfo
        anchors.fill : tablerect
        visible: iscurrentShowTable && devtabswitch.currentActive==0
        
        tableItemDelegate: MyItemDelegate{
        }
        tableHeaderDelegate: TableHeader{
            height:30
            isShow:(styleData.column===0 || styleData.column===1 || styleData.column===2)
        }
        tableRowDelegate: Item{
            height:25//  (styleData.row %2 ==0) ?60 :100
            Rectangle{
                anchors.fill:parent
                color : (styleData.row%2==0)?"#EDF9FF":"#FFFFFF";
            }          
        } 
        tableModel : modelmodule.curmodel
    }

    Monitor_Table_Model{
        id:modelmodule
    }

    Device_Status_Table{
        id:statusifno
        anchors.fill:tablerect
        visible:iscurrentShowTable && devtabswitch.currentActive==1
        tableModel : modelmodule.dummy_status

        bkcolor:"#FF0000"
        tableHeaderDelegate: TableHeader{
            height:16
            headerfontsize:10
            isShow:(styleData.column===0 || styleData.column===1)
        }
        tableRowDelegate: Item{
           // height:styleData.value.uiHeight//  (styleData.row %2 ==0) ?60 :100
            Rectangle{
                anchors.fill:parent
                color : (styleData.row%2==0)?"#EDF9FF":"#FFFFFF";
            }
        }
        tableItemDelegate: DeviceStatusPropertyDelegate{
         }
    }
}
