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
        id: explain1
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
        text: qsTr("1. Go to www.battle.net/bma")
    }
    Label {
        id: explain2
        anchors.top: explain1.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("2. Connect to the account you want secure.")
    }

    Label {
        id: explain3
        anchors.top: explain2.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("3. Click on the button 'Add a Battle.net Authenticator' of the Battle.net Mobile Authenticator.")
    }
    Label {
        id: explain4
        anchors.top: explain3.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("4. Check your email adress.")
    }
    Label {
        id: explain5
        anchors.top: explain4.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("5. Enter the following serial number...")
    }
    Label {
        id: serial
        anchors.top: explain5.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 48
        font.bold: true
        text: Authenticator.serial
    }
    Label {
        id: explain6
        anchors.top: serial.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("6. ...with the following code :")
    }
    Label {
        id: secret
        anchors.top: explain6.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 48
        font.bold: true
        text: Authenticator.token
    }
    Button{
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: secret.bottom
            topMargin: 40
        }
        text: qsTr("Request new serial")
        onClicked: {newSerialDialog.open()}
    }
    
    
    QueryDialog {
        id: newSerialDialog
        icon: Qt.resolvedUrl('khtbma.png')
        titleText: "Warning"
        message: "Are you sure you want to generate a new serial, the old one must before be removed from your battle.net account ?"
        acceptButtonText: qsTr("Accept")
        rejectButtonText: qsTr("Cancel")
        onAccepted: {
                Authenticator.new_serial();
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
