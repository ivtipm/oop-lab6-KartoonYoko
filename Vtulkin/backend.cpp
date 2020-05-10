#include "backend.h"

WaterConsumptionCalculator::WaterConsumptionCalculator(QObject *parent) :
    QObject(parent)
{

}



double WaterConsumptionCalculator::weight(){ return this->_weight; }
double WaterConsumptionCalculator::physicalActivity(){ return this->_physical; }
bool WaterConsumptionCalculator::gender(){ return this->_gender; }

void WaterConsumptionCalculator::setWeight(double w){
    this->_weight = w;
    emit weightChanged();
}
void WaterConsumptionCalculator::setPhysicalActivity(double p){
    this->_physical = p;
    emit physicalActivityChanged();
}
void WaterConsumptionCalculator::setGender(bool s){
    this->_gender = s;
    emit genderChanged();
}

void WaterConsumptionCalculator::calculateWaterConsumption(){
    if(this->gender()){
        this->_amountOfWater = this->weight() * 31 + 400 * this->physicalActivity();
    }
    else{
        this->_amountOfWater = this->weight() * 35 + 600 * this->physicalActivity();
    }
    emit answerChanged();
}


double WaterConsumptionCalculator::answer(){ return this->_amountOfWater; }

void WaterConsumptionCalculator::setAnswer(const double &s){
    this->_amountOfWater = s;
    emit answerChanged();
}
