import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonPageTools
    orientationLock: PageOrientation.LockPortrait
    
    Image {
        anchors.fill: parent
        source: 'background.png'
        fillMode: Image.PreserveAspectCrop
    }

    Label {
        id: restoreSerialLabel
        color: "white";
        anchors.top: parent.top
        anchors.topMargin: 180
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("Serial to restore :")
    }
    TextField {
        id: restoreSerial
        anchors.top: restoreSerialLabel.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        //placeholder: 'US-12345-12345-12345'
    }

    Label {
        id: restoreCodeLabel
        anchors.top: restoreSerial.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("Restore code :")
    }
    TextField {
        id: restoreCode
        anchors.top: restoreCodeLabel.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        //placeholder: 'Restore code'
    }
    Button{
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: restoreCode.bottom
            topMargin: 40
        }
        text: qsTr("Restore")
        onClicked: {restoreSerialDialog.open();}
    }
    
    
    QueryDialog {
        id: restoreSerialDialog
        icon: Qt.resolvedUrl('khtbma.png')
        titleText: "Warning"
        message: "Are you sure you want to restore this serial, the old one will be lost ?"
        acceptButtonText: qsTr("Accept")
        rejectButtonText: qsTr("Cancel")
        onAccepted: {
                
        }
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
