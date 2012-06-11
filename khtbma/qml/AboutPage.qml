import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonPageTools
    orientationLock: PageOrientation.LockPortrait

    Image {
        anchors.fill: parent
        source: 'background.png'
    }

    Label {
        id: label1
        anchors.top: parent.top
        anchors.topMargin: 180
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        horizontalAlignment: Text.Center;
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 48
        font.bold: true
        text: qsTr("KhtBMA v")+Authenticator.__version__
    }
    Label {
        id: label2
        anchors.top: label1.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        horizontalAlignment: Text.Center;
        width: parent.width - 20
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 24
        font.bold: false
        text: qsTr("Khertan Battle.net Mobile Authentificator")
    }
    Label {
        id: label3
        anchors.top: label2.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        horizontalAlignment: Text.Center;
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 24
        font.bold: false
        text: qsTr("")
    }
    Label {
        id: label4
        anchors.top: label3.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        horizontalAlignment: Text.Center;
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 24
        font.bold: false
        text: qsTr("By Benoit HERVIER (Khertan)")
    }
    Label {
        id: label5
        anchors.top: label4.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        horizontalAlignment: Text.Center;
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 24
        font.bold: false
        text: qsTr("Licenced under GPLv3")
    }
    Label {
        id: label6
        anchors.top: label5.bottom
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        horizontalAlignment: Text.Center;
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: false
        text: qsTr("KhtBMA is an unofficial mobile Battle.net Authentificator. It s based on the following library https://github.com/Adys/python-bna, PySide, Qt")
    }

    ToolBarLayout {
        id: commonPageTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-back"
            anchors.left: (parent === undefined) ? undefined : parent.left
            onClicked: {pageStack.pop();}
        }
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }
}
