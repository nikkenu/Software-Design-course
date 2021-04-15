#ifndef CHART_H
#define CHART_H

#include <QBarSeries>
#include <QChart>
#include <QLineSeries>
#include <QObject>
#include <QtCharts>
#include <QDateTime>
//#include "datahandler.h"
#include "xmlparser.h"
#include "fingridhandler.h"
#include "fmihandler.h"

#include <unordered_map>

struct MinMax
{
    int MIN;
    int MAX;
};


class Chart : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(QtCharts::QLineSeries* timeSeries READ getTimeSeries WRITE setTimeSeries NOTIFY timeSeriesSignal)

public:
    explicit Chart(QObject *parent = nullptr, xmlParser *parser = nullptr,
                   Fingridhandler *fingridHandler = nullptr,
                   FMIhandler *fmiHandler = nullptr);
    virtual ~Chart();

    // Properties for setting max and min values for axis (start and end date are on x-axis)´

    Q_PROPERTY(double yMax READ yMax WRITE setYMax NOTIFY yMaxChanged);
    Q_PROPERTY(double yMin READ yMin WRITE setYMin NOTIFY yMinChanged)

    double yMax() const;
    double yMin() const;

    void setYMax(double val);
    void setYMin(double val);







    Q_INVOKABLE void setLineSeries(QLineSeries *lineSeries, QString ID);

    // tells the api handler to get data
    Q_INVOKABLE void getFingridData( const QString &title, const QString &start, const QString &end);
    Q_INVOKABLE void getFMIData( const QString &title, const QString &start, const QString &end);


public slots:
    void receiveFingridData(QByteArray data_from_api, QString ID);
    void receiveFMIData(QByteArray data_from_api, QString ID);

signals:
    void apiRequest(QString title);

    void fingridSeriesReady(QString title);
    void fmiSeriesReady(QString title);


    void yMaxChanged(double value);
    void yMinChanged(double value);

private:
   // QtCharts::QLineSeries* timeSeries_;
   //std::vector<DataHandler::time_series_element> timeSeriesData = {};

   std::unordered_map<QString, std::vector<time_series_element>> timeSeriesData = {};

   double maxY{0}; // some large value for starters....
   double minY{10000000};

   xmlParser *parser_;
   Fingridhandler *fin_;
   FMIhandler *fmi_;


};


#endif // CHART_H
