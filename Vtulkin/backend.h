#ifndef WATERCONSUMPTIOCALCULATOR_H
#define WATERCONSUMPTIOCALCULATOR_H

#include <QObject>
#include <QString>
#include <QVariant>
#include <string>

using namespace std;

class WaterConsumptionCalculator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double weight READ weight WRITE setWeight NOTIFY weightChanged)
    Q_PROPERTY(double physicalActivity READ physicalActivity WRITE setPhysicalActivity NOTIFY physicalActivityChanged)
    Q_PROPERTY(bool gender READ gender WRITE setGender NOTIFY genderChanged)
    Q_PROPERTY(double answer READ answer WRITE setAnswer NOTIFY answerChanged)

private:
    double _weight;
    double _physical;
    bool _gender;

    double _amountOfWater;

public:
    double weight();
    double physicalActivity();
    bool gender();

    void setWeight(double w);
    void setPhysicalActivity(double p);
    void setGender(bool s);

    double answer();
    void setAnswer(const double &s);


    explicit WaterConsumptionCalculator(QObject *parent = nullptr);



signals:
    void weightChanged();
    void physicalActivityChanged();
    void genderChanged();
    void answerChanged();


public slots:
   void calculateWaterConsumption();

};


#endif // WATERCONSUMPTIOCALCULATOR_H
