import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    id:rootitem
    anchors.fill: parent
    property alias bkcolor : background.color

    Rectangle{
        id:background
        anchors.fill:parent
    }

    property alias tableItemDelegate: tableView.itemDelegate
    property alias tableHeaderDelegate: tableView.headerDelegate
    property alias tableRowDelegate: tableView.rowDelegate
    property alias tableModel : tableView.model

    TableView {
        id: tableView
        anchors.fill : background

        verticalScrollBarPolicy:Qt.ScrollBarAlwaysOn

        property int rightmargin : 20
        property int column1 : tableView.width*3/8
        property int column2 : tableView.width*5/8

        TableViewColumn {
            role: "property_name"
            title: "Property"
            width:tableView.column1
            movable: false
            resizable: false
        }

        TableViewColumn {
            role: "content"
            title: ""
            width: tableView.column2
            movable: false
            resizable: false
        }

   }


}
