import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    RestorePage {
        id: restorePage
    }
    SetupPage {
        id: setupPage
    }
    AboutPage {
        id: aboutPage
    }
    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (mainMenu.status === DialogStatus.Closed) ? mainMenu.open() : mainMenu.close()
        }
    }

    Menu {
        id: mainMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr("About"); onClicked: (pageStack.push(aboutPage)) }
            MenuItem { text: qsTr("Setup"); onClicked: (pageStack.push(setupPage))}
        }
    }

    InfoBanner{
                      id:errorBanner
                      text: 'An error occur'
                      timerShowTime: 15000
                      timerEnabled:true
                      anchors.top: parent.top
                      anchors.topMargin: 60
                      anchors.horizontalCenter: parent.horizontalCenter
                 }

    function onError(errMsg) {
        errorBanner.text = errMsg;
        errorBanner.show();
    }    
}
