from sklearn.datasets import load_iris
import mlflow
import mlflow.sklearn
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn import metrics
import matplotlib.pyplot as plt


data =load_iris()

x=data.data
y=data.target

x_train,x_test,y_train,y_test =train_test_split(x,y)
plt.scatter([0,1,2,3],[1,1,2,2])
plt.savefig('iris.png')
plt.close()

with mlflow.start_run():
    dtc =DecisionTreeClassifier(random_state=10)
    dtc.fit(x_train,y_train)
    y_pred=dtc.predict(x_test)
    accuracy=metrics.accuracy_score(y_test,y_pred)
    print(accuracy)
    mlflow.log_param("random_state",10)
    mlflow.log_metric("Accuracy",accuracy)
    mlflow.sklearn.log_model(dtc,"model")
    mlflow.sklearn.save_model(dtc,"C:\\MyWork\\Python\\mlflow\\Dct")
    mlflow.log_artifact("iris.png")