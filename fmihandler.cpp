#include "fmihandler.h"

FMIhandler::FMIhandler()
{
    qDebug() << "FMIhandler test";
    QNetworkRequest request(QUrl("https://api.fingrid.fi/v1/variable/193/event/json"));
    request.setRawHeader("x-api-key", "W8AlS1jgxO7XygNLzms35afCiMEltmZL2ohQkmSP");
    get(request);
}