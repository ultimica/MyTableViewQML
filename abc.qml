import QtQuick 2.0
Item{
    id:root
    anchors.fill : parent

    Rectangle{
        id:bkret
        anchors.fill : parent
        color:"#C4FFD7"
        border.color:"#000000"
        border.width:1
    }

    
    Rectangle{
        id: retcir
        anchors.top : parent.top
        anchors.left: parent.left
        width:80
        height:80
        radius:40
        color :"#FF0000"
        
    }

    MouseArea {
        anchors.fill: retcir

        hoverEnabled: false
        onClicked: {
            controler.dumFun();
        }
    }
    

    Component.onCompleted: {
        console.log("Wid:"+bkret.widt+"Hei:"+bkret.height);

    }

}
