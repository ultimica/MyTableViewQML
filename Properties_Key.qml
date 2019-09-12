import QtQuick 2.0
Item{
    id:root
    anchors.fill : parent

    Rectangle{
        anchors.fill : parent
        color:"#00000000"
    }


    Text{
        anchors.fill : parent
        anchors.leftMargin:2
        text:styleData.value
        verticalAlignment:Text.AlignTop
        horizontalAlignment: Text.AlignLeft
        font.pointSize:10
    }
}
