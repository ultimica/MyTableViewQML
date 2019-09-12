import QtQuick 2.0
import QtQuick.Window 2.1

Window {
    visible: true
    width:600
    height:900
    id:rootWnd
    Rectangle {
                
        id: message_window

        anchors.fill : parent
        color : "#000000"
    }
    
     ListModel {
            id: device_status_dummy
            function someDummy()
            {
                console.log("DUMMY!!!!");
            }

            ListElement {
                property_name: "Module Name"
                enable: true
                content: "XPRO~~"
                subcontrol: "Properties_Key.qml"
                uiHeight:20
                bkcolor:"#FF0000"
             //   ctrl : targetitem
            }
            ListElement {
                property_name: "Version"
                enable: true
                content: "11-22-55"
                subcontrol:"abc.qml"
                uiHeight:90
                bkcolor:"#FFFF00"
             //   ctrl : targetitem
            }

            ListElement {
                property_name: "WTF"
                enable: true
                content: "beta1"
                subcontrol:"Properties_Key.qml"
                uiHeight:20
                bkcolor:"#FF00FF"
             //   ctrl : targetitem
            }
        }

    Item{
        id: targetitem
        function simuAction()
        {
            console.log("Simulation Action");
        }
    }

    Device_Status_Table{
        id:tab
        anchors.fill : message_window
        visible:true
        tableModel : device_status_dummy
        
        property var curtarget : targetitem

        bkcolor:"#FF0000"
        tableHeaderDelegate: TableHeader{
            height:30
            headerfontsize:10
            isShow:(styleData.column===0 || styleData.column===1)
        }
        tableRowDelegate: Item{
            height: rootWnd.getRowHeight(styleData.row)
            Rectangle{
                anchors.fill:parent
                color :(styleData.row%2==0)?"#EDF9FF":"#FFFFFF"// rootWnd.getRowColor(styleData.row)//(styleData.row%2==0)?"#FF0000":"#00FF00";
            }
        }
        tableItemDelegate: DeviceStatusPropertyDelegate{
        }
    }

    function getRowHeight(rowid)
    {
        var subobj= getSubModel(rowid);
        if(subobj==undefined ||subobj==null)
            return 0;
       return device_status_dummy.get(rowid).uiHeight;
    }

    function getRowColor(rowid)
    {
        var subobj= getSubModel(rowid);
        if(subobj==undefined ||subobj==null)
            return "#000000";

        console.log("wid cnt=="+rowid +"  cnt=="+device_status_dummy.count);

        return device_status_dummy.get(rowid).bkcolor;
    }

    function getSubModel(rowid)
    {
        if(rowid==undefined)
            return null;
        return device_status_dummy.get(rowid);
    }
}
