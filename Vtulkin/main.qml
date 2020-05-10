import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.2
import WaterCalc 1.0
import QtGraphicalEffects 1.0

Window {

    id: root
    title: qsTr("Калькулятор потребления воды")
    visible: true
    height: 480
    width: 900
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    WaterCalc{
        id: watercalc
        weight: sliderWeight.value
        physicalActivity: sliderPhysicalActivity.value
        gender: btn_female.highlighted
        onWeightChanged: {
            watercalc.calculateWaterConsumption();
            console.log("onWeightChanged called!");
        }
        onGenderChanged: {
            console.log("onGenderChanged called!");
            watercalc.calculateWaterConsumption();
        }
        onPhysicalActivityChanged: {
            console.log("onPhysicalActivityChanged called!");
            watercalc.calculateWaterConsumption();
        }
    }



    Connections {
        target: watercalc
        onAnswerChanged: { console.log("onAnswerChanged called!"); }
    }

    Image {
        source: icon.url(Qt.size(64, 64))
    }

    Row {
        id: rowChangeGender
        x: 15
        y: 0
        width: 289
        height: 40

        Label {
            id: label_gender

            text: qsTr("Пол")

        }

        Pane {
            id: panel
        }

        Button {
            id: btn_male

            text: qsTr("Мужской")
            autoRepeat: false
            highlighted: true
            onClicked: {
                if (btn_female.highlighted){
                    btn_female.highlighted = false
                }
                highlighted = true
            }
        }

        Button {
            id: btn_female
            text: qsTr("Женский")
            onClicked: {
                if (btn_male.highlighted){
                    btn_male.highlighted = false
                }
                highlighted = true
            }
        }




    }


    Column {
        id: columnWeight
        x: 15
        y: 64


        width: 289
        height: 111

        Row {
            id: rowChangeWeight
            width: 329
            height: 44

            Label {
                id: label_word_weight
                text: qsTr("Вес")
            }

            Pane {
                id: pane1
                width: 123
                height: 33
            }

            Label {
                id: label_weight
                color: "#00aaff"
                text: sliderWeight.value + qsTr(" кг")
            }
        }


        Slider {
            id: sliderWeight
            from: 20
            value: 50
            to: 140
            width: 200
            height: 28
            snapMode: Slider.NoSnap





            Row {
                id: row2
                x: 7
                y: 30
                width: 193
                height: 19

                Label {
                    id: label3
                    text: qsTr("20 ----------------- 80 ----------------- 140")
                }
            }
        }

    }

    TextArea {
        id: textArea
        x: 585
        y: 233
        width: 260
        height: 199

        readOnly: true
        text:
            qsTr("   В данном калькуляторе производится расчет
потребления чистой питьевой и минеральной
лечебно-столовой воды. Это то количество
воды, которое желательно выпивать помимо
чая, кофе, соков и других напитков.\n
Правильное потребление воды помогает
пищеварению, нормализации веса, улучшает
цвет и состояние кожи.Рекомендуется пить за
30 минут до еды и между приемами пищи.
")

        font.pointSize: 8
        font.family: "MS Shell Dlg 2"
    }

    TextArea {
        id: textArea1
        x: 585
        y: 64
        width: 174
        height: 26

        readOnly: true
        color: "#00aaff"
        text: qsTr("Ваша рекомендованная норма")
    }

    TextArea {
        id: textAreaOutput
        x: 595
        y: 96

        readOnly: true
        font.pointSize: 14
        color: "#00557f"
        text: Number(watercalc.answer / 1000).toFixed(2) + qsTr(" литра")
    }

    TextArea {
        id: textArea3
        x: 585
        y: 133

        readOnly: true
        color: "#00aaff"
        text: qsTr("воды в день")
    }

    TextArea {
        id: textArea4
        x: 6
        y: 371
        width: 266
        height: 61

        readOnly: true
        color: "#00aaff"
        text: qsTr("*Данный расчет носит рекомендательный
характер. Чтобы получить более точную
информацию Вы можете задав вопрос диетологу")
    }

    Rectangle {
        id: rectangle_image
        x: 310
        y: 15
        width: 244
        height: 405
        //color: "#00aaff"
        color: "#ffffff"
        opacity: 0.391
        visible: true


        Image{
            id: image_water
            //x: 310
            //y: 15
            visible: false
            width: 238
            height: 399
            source: "images/1200px-Wikipe-tan_full_length.svg.png"
        }

        Image {
            id: image_bottle
            //x: 310
            //y: 15

            smooth: true
            visible: true
            width: 244
            height: 405
            fillMode: Image.PreserveAspectCrop
            source: "images/bottle_3.1.jpg"

            //layer.enabled: true
            //layer.effect: OpacityMask {
            //    maskSource: Item {
            //        width: image_bottle.width
            //        height: image_bottle.height
            //        Rectangle {
            //            anchors.centerIn: parent
            //            width: image_bottle.adapt ? image_bottle.width : Math.min(image_bottle.width, image_bottle.height)
            //            height: image_bottle.adapt ? image_bottle.height : width
            //            radius: 30
            //
            //            color: "#00aaff"
            //        }
            //    }
            //}
        }


    }

    Column {
        id: columnPhysicalActivity
        x: 15
        y: 228
        width: 277
        height: 111
        Row {
            id: rowChangeWeight1
            width: 329
            height: 44
            Label {
                id: label4
                text: qsTr("Физическая активность")
            }

            Pane {
                id: pane2
                width: 67
                height: 33
            }

            Label {
                id: label5
                color: "#00aaff"
                text: Number(sliderPhysicalActivity.value).toFixed(0) + qsTr(" ч")
            }

        }

        Slider {
            id: sliderPhysicalActivity
            from: 0
            value: 1
            to: 6
            width: 200
            height: 28
            snapMode: Slider.NoSnap
            Row {
                id: row3
                x: 7
                y: 30
                width: 193
                height: 19
                Label {
                    id: label6
                    text: qsTr("0 ------------------- 3 ------------------- 6")
                }
            }
        }
    }










}
