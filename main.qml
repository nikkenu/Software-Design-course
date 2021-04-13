import QtQuick 2.14
import QtQuick.Window 2.14
import QtCharts 2.3
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4


Window {
    id: window
    width: 1000
    height: 720
    visible: true
    property alias rowLayoutWidth: rowLayout.width

    Column {
        id: column
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0

        ChartView {
            id: line
            width: column.width
            height: column.height/2
            backgroundColor: "#00000000"
            LineSeries {
                id: consumptionChart
            }

        }

        RowLayout {
            id: rowLayout2
            width: 100
            height: 100
            spacing: 20

            Column {
                id: column1
                height: 330
                padding: 10
                spacing: 5

                Text {
                    id: text2
                    text: qsTr("Weather")
                    font.pixelSize: 12
                }

                CheckBox {
                    id: temperatureCheckBox
                    text: qsTr("Temperature")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // Make API request
                        } else {
                            // Remove lineseries
                        }
                    }
                }

                CheckBox {
                    id: obsWindCheckBox
                    text: qsTr("Observed wind")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // Make API request
                        } else {
                            // Remove lineseries
                        }
                    }
                }

                CheckBox {
                    id: obsCloudinessCheckBox
                    text: qsTr("Observed cloudiness")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // Make API request
                        } else {
                            // Remove lineseries
                        }
                    }
                }

                CheckBox {
                    id: predWindCheckBox
                    text: qsTr("Predicted wind")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // Make API request
                        } else {
                            // Remove lineseries
                        }
                    }
                }

                CheckBox {
                    id: predCloudinessCheckBox
                    text: qsTr("Predicted cloudiness")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // Make API request
                        } else {
                            // Remove lineseries
                        }
                    }
                }
            }
            Column {
                id: column2
                height: 330
                padding: 10
                spacing: 5

                Text {
                    id: text3
                    text: qsTr("Electricity")
                    font.pixelSize: 12
                }

                CheckBox {
                    id: eConCheckBox
                    text: qsTr("Electricity consumption in Finland")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            chart.showData();
                            chart.makeRequest();
                        } else {
                            // Remove lineseries
                        }
                    }
                }

                CheckBox {
                    id: eConForecastCheckBox
                    text: qsTr("Electricity consumption forecast for the next 24 hours")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // Make API request
                        } else {
                            // Remove lineseries
                        }
                    }
                }

                CheckBox {
                    id: eProdPredictionCheckBox
                    text: qsTr("A tentative production prediction for the next 24 hours as hourly energy")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // functionality
                        } else {
                            // Remove lineseries
                        }
                    }
                }

                CheckBox {
                    id: eProdCheckBox
                    text: qsTr("Electricity production")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // Make API request
                        } else {
                            // Remove lineseries
                        }
                    }
                }

                CheckBox {
                    id: windPowerProdForecastCheckBox
                    text: qsTr("Wind power production forecast")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // Make API request
                        } else {
                            // Remove lineseries
                        }
                    }
                }

                CheckBox {
                    id: nuclearProdCheckBox
                    text: qsTr("Nuclear power production")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // Make API request
                        } else {
                            // Remove lineseries
                        }
                    }
                }

                CheckBox {
                    id: hydroProdCheckBox
                    text: qsTr("Hydro power production")
                    onCheckedStateChanged: function() {
                        if(checkedState) {
                            // Make API request
                        } else {
                            // Remove lineseries
                        }
                    }
                }
            }

            Column {
                id: column3
                width: 200
                height: 239
                spacing: 5


                Text {
                    id: text4
                    text: qsTr("Date")
                    font.pixelSize: 12
                }

                RowLayout {
                    id: rowLayout

                    Text {
                        id: text5
                        text: qsTr("From")
                        font.pixelSize: 12
                    }

                    TextField {
                        id: dateFromTextField
                        text: "2021-03-15T13:11:51Z"
                        placeholderText: qsTr("Text Field")
                    }

                }

                RowLayout {
                    id: rowLayout1

                    Text {
                        id: text6
                        text: qsTr("To")
                        font.pixelSize: 12
                    }

                    TextField {
                        id: dateToTextField
                        width: 127
                        height: 20
                        text: "2021-03-18T13:11:51Z"
                        placeholderText: qsTr("Text Field")
                        enabled: false;
                    }

                    CheckBox {
                        id: nowCheckBox
                        text: qsTr("Now")
                        checked: true
                        onCheckedStateChanged: function() {
                            if(checkedState) {
                                dateToTextField.enabled = false;
                            } else {
                                dateToTextField.enabled = true;
                            }
                        }
                    }
                }


                Button {
                    id: refreshButton
                    text: qsTr("Refresh")
                }
            }

        }
    }

    Component.onCompleted: {
        chart.timeSeries = consumptionChart
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:9}D{i:13}D{i:1}
}
##^##*/
