import QtQuick 2.0
Item{
    id:root
    
    property bool isShow : false
    property alias headerfontsize : text.font.pointSize

    Rectangle{
        visible:isShow
        anchors.fill :parent
        border.color : "#515151"
        color :"#6B6B6B"

        Text{
            id: text
            anchors.fill : parent
            anchors.leftMargin:5
            anchors.topMargin:4
            anchors.bottomMargin:4
            text:styleData.value
            verticalAlignment:Text.AlignVCenter
            font.pointSize:12
            font.bold : true
            color : "#FFFFFF"
        }  
    }
    
}
