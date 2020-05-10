#include <QGuiApplication>
#include <QQmlApplicationEngine>


#include <QQuickView>
#include <QtQml/QQmlContext>

#include <QtGui/QGuiApplication>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlContext>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlComponent>

#include "../../Lab 6/lab6/backend.h"

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon("C:/Users/Jarvis/Desktop/oop/Term 4/Lab 6/lab6/images/water_sign.png"));
    QQmlApplicationEngine engine;

    qmlRegisterType<WaterConsumptionCalculator>("WaterCalc", 1, 0, "WaterCalc");         // 2 способ подключить c++


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


    engine.load(url);

    

    return app.exec();
}
