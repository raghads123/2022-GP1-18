from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from sklearn.metrics.pairwise import cosine_similarity
#from surprise import Dataset, SVD, accuracy, Reader
from sklearn.svm import SVR
from sklearn.model_selection import train_test_split
#from surprise.model_selection import train_test_split
import pandas as pd
import numpy as np

service_acc_key = {
    "type": "service_account",
    "project_id": "count-me-in-f7e83",
    "private_key_id": "dc6db3f15b228dd16b6eebca1b01f54ba4f118d9",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC9hw98xYrab27w\ntp92KeBfxEYObz7Il3xqAuRA7f4vU/NECaoORttSzd/UTnFUBLegQeRQLLEWIzQT\nlamlReyzYMGPoo2ZJcFH/2fNdPk9F5jnxvbpbFkLUm78S34V4V3XiJiacv+tBNqk\nduKwquC0Ci4VGcpkVedfW3ndGek8HPja4lArGLX1+5uMcQz0makwopLq+U83K9K6\nA3Qy4F4wcSWFE6lZ3angxhhZvwbhRqcbjXymHBRl4rx6jGwYXinhSYCDWuyJTFu3\nDw30uQoq0krh0Vi7clYpdKW7ddsVO+5JMdXDxVJIwwz6FrZJeaeNDs5bL8XnXMYm\n4ePVOZrjAgMBAAECggEADOmzUe50R+6uBy4szim16lXJP3mFNGMx1wKMbP9qFpe9\n1tBhFZOZT4Uhr2mKyiJ/elE9o4LFVqXztIk5Y5PQjTuAj0SQKN420td2yeZNhu6L\n0fAvPsx4LU/NVQOLEHroNbj49hOeEjqRmlapRPKCLcdrHVqXp19nogptp/VN0Upl\nW5opwtOzErps6cBARYpXo0jqwWfDF9WTekaj/EyFh7/HhNaKZMCgrASHnImtbE3t\nqx6km/8L+STGdrgWyPuMwrBkZmO+tP85X8RdpAQ7Ey8AiaDvHFquaILG8HL8ivQq\nB6RBT+E1MirFWvmPIJSOZ6T+vjqQp61gngmk3xIwLQKBgQDfDjVnDYCZa8/D2pV1\nvcl16grUBbL1hNuz+MLxLcSlRqTOhgevnTk2MbMNQZivVCWkFcA5dIGbVmFOI3pH\nMYZH4VQJ9P/7C9u0zrHFeEvzyeJQJuzr8sG009CN5aLZ4BSXR5uLf9SoIZEzvY85\nejvF+USqnDYNICKQUrX6wgniFwKBgQDZhSbWHrRy+Q/zn/EDQBqsvzLPJmnNGgmG\nlVQQ/RwnDY5ZC0FWx9Sigb3IQAb20pE9+h3jRKhW78vBtjOu+8AiFYa6vyf6g/1O\nVrdPcIl2O/j3zHAN9VD3Evi4ES/a/7K8VXBbjZK/13Jk86BHL5kPYliNCMEpAx57\nimhYJQrJFQKBgFsmNkJnbR7ExME3KI5VwOazfjtIHOphoVo5FIhz+IDFjoFqmed0\nqzVvN8j5/kffbgZQcR3Jc1EkCl1g+A3xufrTpIDxIk3Xea+4K0MTto3n+NhiH70H\nlYqsZ/QkW9kGzcNIGtL1qNQP64MmOkn1nkl3ZE0HyrqwYA90DTNsaZd/AoGAGBzj\nlj7nIAuuEgK78/FKQ7YaSs5mUh89yRaKsCtu0IF3MzXFM3qJfs5FHIrEet4Szb0J\nTSVSR/jjLIEnL5Gm1eBvBAqmwuWY0fNY9Mxz4JB7Y/Tcwx9br1gCDF2TYYKQ7MHH\n585E41Fd1AUR0nJbVFJBoLjEuOgom+dW89Z/YJUCgYEAtTE4uSsOha1TmAqN6YTn\nLkHH0WyjKAO4J2tJZ8HAad1CIrOczZLiOcv+H4ebISLlWOR68JBmoRhAICV16KH9\nGceAcRm0P+ocJnRed6AP5b5WcxyL6ZgLMNNyZ8gAKjJFWA6hBZ4jSpbcW4JX8yDy\nnqAlwF3WUVjVGQm+dAU5dA0=\n-----END PRIVATE KEY-----\n",
    "client_email": "firebase-adminsdk-4wq0c@count-me-in-f7e83.iam.gserviceaccount.com",
    "client_id": "101618090020024162192",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-4wq0c%40count-me-in-f7e83.iam.gserviceaccount.com"
    }
cred = credentials.Certificate(service_acc_key)

firebase_admin.initialize_app(cred)

db = firestore.client()


class CountMeInApi(APIView):
    def get(self, request, *args, **kwargs):
        data = ["WELCOME TO COUNT ME IN API"]
        return Response(data)
        
class CountMeInCoursesContentBased(APIView):  
    def post(self, request, *args, **kwargs):
        user_ID = request.data
        print(user_ID["user_ID"])
        #data courses rating
        doc = db.collection('rating')
        data = doc.stream()
        
        #all courses
        doc_courses = db.collection('extra_acts')
        data_courses = doc_courses.stream()
        
        #users history
        hist = db.collection('user_history')
        data_hist = hist.stream()

        rating_data = {}
        all_data = {}
        prepared_data = {}
        users_hist = {}
        
        
        #preprocessing
        
        for d in data_courses:
            if d.to_dict()["Act_type"] == 'دورة تدريبية':
                all_data[d.id] = d.to_dict()
                prepared_data[d.id] = []
                
        for d in data:
            if d.to_dict()["Act_type"] == 'دورة تدريبية':
                rating_data[d.id] = d.to_dict()
                #print(d.to_dict()["Act_ID"])
        
        for i in all_data:
            for j in rating_data:
                if str(i) == str(rating_data[j]["Act_ID"]):
                    prepared_data[i].append(rating_data[j]["rating"])
                else :
                    prepared_data[i].append(0)
                #break
            #break
            
        for u in data_hist:
            if u.to_dict()["ACT_type"] == 'دورة تدريبية':
                users_hist[u.to_dict()["user_email"]] = u.to_dict()["extra_activityID"]
            
        #for k in prepared_data:
        #    print(len(prepared_data[k]))
        #collection historic --> {"useremail":raghad@gmail.com, "ID_course":"4GHKJH", "ACT_Type":""}  --> raghad@gmail.com
        
        cs = {}
        
        # get the historic and user ---> calcul the CS between course ID (historic) and all other courses
        
        #calcul the Cosine Similarity between history course and other courses
        if user_ID["user_ID"] in users_hist:
            for course in prepared_data:
                cs[course] = cosine_similarity([prepared_data[users_hist[user_ID["user_ID"]]]],[prepared_data[course]])[0][0]
                
        
        #calcul the Cosine Similarity between all courses
        else:
            for course in prepared_data:
                list_cs = []
                for course1 in prepared_data:
                    #print(cosine_similarity([prepared_data[course]],[prepared_data[course1]])[0][0])
                    list_cs.append(cosine_similarity([prepared_data[course]],[prepared_data[course1]])[0][0])            
                cs[course] = sum(list_cs)
        
        #sorting by the CS 
        cs = sorted(cs.items(), key=lambda x: x[1], reverse=True) 
        
        #change format OUTPUT
        cs_final = {}
        cs_final1 = []
        for c in cs:
            cs_final[c[0]] = c[1]
            cs_final1.append(c[0])

        data_output = {"data":[]}  # --> {course1:{}}
        for ID in cs_final1:
            try:
                data_output["data"].append(all_data[ID])
            except:
                   for element in all_data:
                       if all_data[element]["Act_ID"] == ID:
                           data_output["data"].append(all_data[element])
                       else:
                           pass
        
        return Response(data_output)


class CountMeInCoursesModelBased(APIView):        
    def post(self, request, *args, **kwargs):
        user_ID = request.data
        print(user_ID["user_ID"])
        doc = db.collection('rating')
        data_ = doc.stream()
        
        #all courses
        doc_courses = db.collection('extra_acts')
        data_courses = doc_courses.stream()
        
        #all users
        doc_users = db.collection('users')
        data_users = doc_users.stream()
        
        rating_data = {}
        users_data = {}
        all_data = {}
        dataset = {"userID":[],"courseID":[],"rating":[]}
        
        
        count1 = 0
        count2 = 0
        for d in data_:
            if d.to_dict()["Act_type"] == 'دورة تدريبية':
                rating_data[d.id] = d.to_dict()
                
        for d in data_courses:
            if d.to_dict()["Act_type"] == 'دورة تدريبية':
                all_data[d.id] = [d.to_dict(),count1]
                count1 = count1 + 1
                
        for d in data_users:
            users_data[d.id] = [d.to_dict()["email"],count2]
            count2 = count2 + 1
        
        for i in users_data:  #user1 --> all courses 
            for j in all_data:
                for k in rating_data :
                    if rating_data[k]["Act_ID"] == all_data[j][0]["Act_ID"]:
                        if rating_data[k]["useremail"] == users_data[i][0]:  
          #          if users_data[i] == rating_data[k]["useremail"] and all_data[j]["Act_ID"] == rating_data[k]["Act_ID"]:
                            dataset["userID"].append(users_data[i][1])
                            dataset["courseID"].append(all_data[j][1])
                            dataset["rating"].append(rating_data[k]["rating"])
                        else :
                            dataset["userID"].append(users_data[i][1])
                            dataset["courseID"].append(all_data[j][1])
                            dataset["rating"].append(0)
                    else :
                        dataset["userID"].append(users_data[i][1])
                        dataset["courseID"].append(all_data[j][1])
                        dataset["rating"].append(0)
        # indexing userID & courseID --> {'ID1':1,'ID2':2,....}   user ID1 : 1 
        #Model Based
        
        dataset = pd.DataFrame(dataset)
        #dataset.to_excel('data.xlsx')
        
        #----> preprocessing for dataset ---> delete missing values (NAN)  ---> delete duplications
        
        # delete missing values (NAN)
        dataset = dataset.dropna()
        
        # delete duplications
        dataset = dataset.drop_duplicates()
        
        #dataset = dataset.dropna()
        
        #dataset.to_excel('dataset.xlsx')
        
        #reader = Reader(rating_scale=(1, 5))
        #data = Dataset.load_from_df(dataset[["userID", "courseID","rating"]], reader)
        # Split the dataset
        x = dataset[['userID','courseID']].to_numpy()
        y = dataset["rating"].to_numpy()
        trainsetx,testsetx,trainsety,testsety = train_test_split(x,y, test_size=.20)
        
        #training
        model = SVR()
        model.fit(trainsetx,trainsety)
        
        #prediction
        prediction_data = {}
        
        for i in users_data:
            if str(users_data[i][0]) == str(user_ID["user_ID"]):
                for course in all_data:
                    pred = model.predict([[users_data[i][1],all_data[course][1]]])
                    print(pred)
                    prediction_data[all_data[course][0]["Act_ID"]] = pred
            
        #{
        #    "user_ID":"441201395@student.ksu.edu.sa"
        #}
        prediction_data = sorted(prediction_data.items(), key=lambda x: x[1], reverse=True)
        
        #change format OUTPUT
        prediction_data_final = {}
        prediction_data_final1 = []
        for c in prediction_data:
            prediction_data_final[c[0]] = c[1]
            prediction_data_final1.append(c[0])
        
        #
        data_output = {"data":[]}  # --> {course1:{}}
        for ID in prediction_data_final1:
            try:
                data_output["data"].append(all_data[ID][0])
            except:
                   for element in all_data:
                       if all_data[element][0]["Act_ID"] == ID:
                           data_output["data"].append(all_data[element][0])
                       else:
                           pass
        
        return Response(data_output)


    

class CountMeInActivityContentBased(APIView):
    def post(self, request, *args, **kwargs):
        user_ID = request.data
        print(user_ID["user_ID"])
        #data courses rating
        doc = db.collection('rating')
        data = doc.stream()
        
        #all courses
        doc_courses = db.collection('extra_acts')
        data_courses = doc_courses.stream()
        
        #users history
        hist = db.collection('user_history')
        data_hist = hist.stream()

        rating_data = {}
        all_data = {}
        prepared_data = {}
        users_hist = {}
        
        
        #preprocessing
        
        for d in data_courses:
            if d.to_dict()["Act_type"] == 'فعالية':
                all_data[d.id] = d.to_dict()
                prepared_data[d.id] = []
                
        for d in data:
            if d.to_dict()["Act_type"] == 'فعالية':
                rating_data[d.id] = d.to_dict()
                #print(d.to_dict()["Act_ID"])
        
        for i in all_data:
            for j in rating_data:
                if str(i) == str(rating_data[j]["Act_ID"]):
                    prepared_data[i].append(rating_data[j]["rating"])
                else :
                    prepared_data[i].append(0)
                #break
            #break
            
        for u in data_hist:
            if u.to_dict()["ACT_type"] == 'فعالية':
                users_hist[u.to_dict()["user_email"]] = u.to_dict()["extra_activityID"]
            
        #for k in prepared_data:
        #    print(len(prepared_data[k]))
        #collection historic --> {"useremail":raghad@gmail.com, "ID_course":"4GHKJH", "ACT_Type":""}  --> raghad@gmail.com
        
        cs = {}
        
        # get the historic and user ---> calcul the CS between course ID (historic) and all other courses
        
        #calcul the Cosine Similarity between history course and other courses
        if user_ID["user_ID"] in users_hist:
            for course in prepared_data:
                cs[course] = cosine_similarity([prepared_data[users_hist[user_ID["user_ID"]]]],[prepared_data[course]])[0][0]
                
        
        #calcul the Cosine Similarity between all courses
        else:
            for course in prepared_data:
                list_cs = []
                for course1 in prepared_data:
                    #print(cosine_similarity([prepared_data[course]],[prepared_data[course1]])[0][0])
                    list_cs.append(cosine_similarity([prepared_data[course]],[prepared_data[course1]])[0][0])            
                cs[course] = sum(list_cs)
        
        #sorting by the CS 
        cs = sorted(cs.items(), key=lambda x: x[1], reverse=True) 
        
        #change format OUTPUT
        cs_final = {}
        cs_final1 = []
        for c in cs:
            cs_final[c[0]] = c[1]
            cs_final1.append(c[0])

        data_output = {"data":[]}  # --> {course1:{}}
        for ID in cs_final1:
            try:
                data_output["data"].append(all_data[ID])
            except:
                   for element in all_data:
                       if all_data[element]["Act_ID"] == ID:
                           data_output["data"].append(all_data[element])
                       else:
                           pass
        
        return Response(data_output)


class CountMeInActivityModelBased(APIView):
    def post(self, request, *args, **kwargs):
        user_ID = request.data
        print(user_ID["user_ID"])
        doc = db.collection('rating')
        data_ = doc.stream()
        
        #all courses
        doc_courses = db.collection('extra_acts')
        data_courses = doc_courses.stream()
        
        #all users
        doc_users = db.collection('users')
        data_users = doc_users.stream()
        
        rating_data = {}
        users_data = {}
        all_data = {}
        dataset = {"userID":[],"courseID":[],"rating":[]}
        
        
        count1 = 0
        count2 = 0
        for d in data_:
            if d.to_dict()["Act_type"] == 'فعالية':
                rating_data[d.id] = d.to_dict()
                
        for d in data_courses:
            if d.to_dict()["Act_type"] == 'فعالية':
                all_data[d.id] = [d.to_dict(),count1]
                count1 = count1 + 1
                
        for d in data_users:
            users_data[d.id] = [d.to_dict()["email"],count2]
            count2 = count2 + 1
        
        for i in users_data:  #user1 --> all courses 
            for j in all_data:
                for k in rating_data :
                    if rating_data[k]["Act_ID"] == all_data[j][0]["Act_ID"]:
                        if rating_data[k]["useremail"] == users_data[i][0]:  
          #          if users_data[i] == rating_data[k]["useremail"] and all_data[j]["Act_ID"] == rating_data[k]["Act_ID"]:
                            dataset["userID"].append(users_data[i][1])
                            dataset["courseID"].append(all_data[j][1])
                            dataset["rating"].append(rating_data[k]["rating"])
                        else :
                            dataset["userID"].append(users_data[i][1])
                            dataset["courseID"].append(all_data[j][1])
                            dataset["rating"].append(0)
                    else :
                        dataset["userID"].append(users_data[i][1])
                        dataset["courseID"].append(all_data[j][1])
                        dataset["rating"].append(0)
        # indexing userID & courseID --> {'ID1':1,'ID2':2,....}   user ID1 : 1 
        #Model Based
        
        dataset = pd.DataFrame(dataset)
        #dataset.to_excel('data.xlsx')
        
        #----> preprocessing for dataset ---> delete missing values (NAN)  ---> delete duplications
        
        # delete missing values (NAN)
        dataset = dataset.dropna()
        
        # delete duplications
        dataset = dataset.drop_duplicates()
        
        #dataset = dataset.dropna()
        
        #dataset.to_excel('dataset.xlsx')
        
        #reader = Reader(rating_scale=(1, 5))
        #data = Dataset.load_from_df(dataset[["userID", "courseID","rating"]], reader)
        # Split the dataset
        x = dataset[['userID','courseID']].to_numpy()
        y = dataset["rating"].to_numpy()
        trainsetx,testsetx,trainsety,testsety = train_test_split(x,y, test_size=.20)
        
        #training
        model = SVR()
        model.fit(trainsetx,trainsety)
        
        #prediction
        prediction_data = {}
        
        for i in users_data:
            if str(users_data[i][0]) == str(user_ID["user_ID"]):
                for course in all_data:
                    pred = model.predict([[users_data[i][1],all_data[course][1]]])
                    print(pred)
                    prediction_data[all_data[course][0]["Act_ID"]] = pred
            
        #{
        #    "user_ID":"441200994@student.ksu.edu.sa"
        #}
        prediction_data = sorted(prediction_data.items(), key=lambda x: x[1], reverse=True)
        
        #change format OUTPUT
        prediction_data_final = {}
        prediction_data_final1 = []
        for c in prediction_data:
            prediction_data_final[c[0]] = c[1]
            prediction_data_final1.append(c[0])
        
        data_output = {"data":[]}  # --> {course1:{}}
        for ID in prediction_data_final1:
               try:
                   data_output["data"].append(all_data[ID][0]) 
               except:
                   for element in all_data:
                       if all_data[element][0]["Act_ID"] == ID:
                           data_output["data"].append(all_data[element][0])
                       else:
                           pass
        
        return Response(data_output)
    
    
class CountMeInWorkshopContentBased(APIView):
    def post(self, request, *args, **kwargs):
        user_ID = request.data
        print(user_ID["user_ID"])
        #data courses rating
        doc = db.collection('rating')
        data = doc.stream()
        
        #all courses
        doc_courses = db.collection('extra_acts')
        data_courses = doc_courses.stream()
        
        #users history
        hist = db.collection('user_history')
        data_hist = hist.stream()

        rating_data = {}
        all_data = {}
        prepared_data = {}
        users_hist = {}
        
        
        #preprocessing
        
        for d in data_courses:
            if d.to_dict()["Act_type"] == 'ورشة عمل':
                all_data[d.id] = d.to_dict()
                prepared_data[d.id] = []
                
        for d in data:
            if d.to_dict()["Act_type"] == 'ورشة عمل':
                rating_data[d.id] = d.to_dict()
                #print(d.to_dict()["Act_ID"])
        
        for i in all_data:
            for j in rating_data:
                if str(i) == str(rating_data[j]["Act_ID"]):
                    prepared_data[i].append(rating_data[j]["rating"])
                else :
                    prepared_data[i].append(0)
                #break
            #break
            
        for u in data_hist:
            if u.to_dict()["ACT_type"] == 'ورشة عمل':
                users_hist[u.to_dict()["user_email"]] = u.to_dict()["extra_activityID"]
            
        #for k in prepared_data:
        #    print(len(prepared_data[k]))
        #collection historic --> {"useremail":raghad@gmail.com, "ID_course":"4GHKJH", "ACT_Type":""}  --> raghad@gmail.com
        
        cs = {}
        
        # get the historic and user ---> calcul the CS between course ID (historic) and all other courses
        
        #calcul the Cosine Similarity between history course and other courses
        if user_ID["user_ID"] in users_hist:
            for course in prepared_data:
                cs[course] = cosine_similarity([prepared_data[users_hist[user_ID["user_ID"]]]],[prepared_data[course]])[0][0]
                
        
        #calcul the Cosine Similarity between all courses
        else:
            for course in prepared_data:
                list_cs = []
                for course1 in prepared_data:
                    #print(cosine_similarity([prepared_data[course]],[prepared_data[course1]])[0][0])
                    list_cs.append(cosine_similarity([prepared_data[course]],[prepared_data[course1]])[0][0])            
                cs[course] = sum(list_cs)
        
        #sorting by the CS 
        cs = sorted(cs.items(), key=lambda x: x[1], reverse=True) 
        
        #change format OUTPUT
        cs_final = {}
        cs_final1 = []
        for c in cs:
            cs_final[c[0]] = c[1]
            cs_final1.append(c[0])

        data_output = {"data":[]}  # --> {course1:{}}
        for ID in cs_final1:
            try:
                data_output["data"].append(all_data[ID])
            except:
                   for element in all_data:
                       if all_data[element]["Act_ID"] == ID:
                           data_output["data"].append(all_data[element])
                       else:
                           pass
        
        return Response(data_output)


class CountMeInWorkshopModelBased(APIView):
    def post(self, request, *args, **kwargs):
        user_ID = request.data
        print(user_ID["user_ID"])
        doc = db.collection('rating')
        data_ = doc.stream()
        
        #all courses
        doc_courses = db.collection('extra_acts')
        data_courses = doc_courses.stream()
        
        #all users
        doc_users = db.collection('users')
        data_users = doc_users.stream()
        
        rating_data = {}
        users_data = {}
        all_data = {}
        dataset = {"userID":[],"courseID":[],"rating":[]}
        
        
        count1 = 0
        count2 = 0
        for d in data_:
            if d.to_dict()["Act_type"] == 'ورشة عمل':
                rating_data[d.id] = d.to_dict()
                
        for d in data_courses:
            if d.to_dict()["Act_type"] == 'ورشة عمل':
                all_data[d.id] = [d.to_dict(),count1]
                count1 = count1 + 1
                
        for d in data_users:
            users_data[d.id] = [d.to_dict()["email"],count2]
            count2 = count2 + 1
        
        for i in users_data:  #user1 --> all courses 
            for j in all_data:
                for k in rating_data :
                    if rating_data[k]["Act_ID"] == all_data[j][0]["Act_ID"]:
                        if rating_data[k]["useremail"] == users_data[i][0]:  
          #          if users_data[i] == rating_data[k]["useremail"] and all_data[j]["Act_ID"] == rating_data[k]["Act_ID"]:
                            dataset["userID"].append(users_data[i][1])
                            dataset["courseID"].append(all_data[j][1])
                            dataset["rating"].append(rating_data[k]["rating"])
                        else :
                            dataset["userID"].append(users_data[i][1])
                            dataset["courseID"].append(all_data[j][1])
                            dataset["rating"].append(0)
                    else :
                        dataset["userID"].append(users_data[i][1])
                        dataset["courseID"].append(all_data[j][1])
                        dataset["rating"].append(0)
        # indexing userID & courseID --> {'ID1':1,'ID2':2,....}   user ID1 : 1 
        #Model Based
        
        dataset = pd.DataFrame(dataset)
        #dataset.to_excel('data.xlsx')
        
        #----> preprocessing for dataset ---> delete missing values (NAN)  ---> delete duplications
        
        # delete missing values (NAN)
        dataset = dataset.dropna()
        
        # delete duplications
        dataset = dataset.drop_duplicates()
        
        #dataset = dataset.dropna()
        
        #dataset.to_excel('dataset.xlsx')
        
        #reader = Reader(rating_scale=(1, 5))
        #data = Dataset.load_from_df(dataset[["userID", "courseID","rating"]], reader)
        # Split the dataset
        x = dataset[['userID','courseID']].to_numpy()
        y = dataset["rating"].to_numpy()
        trainsetx,testsetx,trainsety,testsety = train_test_split(x,y, test_size=.20)
        
        #training
        model = SVR()
        model.fit(trainsetx,trainsety)
        
        #prediction
        prediction_data = {}
        
        for i in users_data:
            if str(users_data[i][0]) == str(user_ID["user_ID"]):
                for course in all_data:
                    pred = model.predict([[users_data[i][1],all_data[course][1]]])
                    print(pred)
                    prediction_data[all_data[course][0]["Act_ID"]] = pred
            
        #{
        #    "user_ID":"441200994@student.ksu.edu.sa"
        #}
        prediction_data = sorted(prediction_data.items(), key=lambda x: x[1], reverse=True)
        
        #change format OUTPUT
        prediction_data_final = {}
        prediction_data_final1 = []
        for c in prediction_data:
            prediction_data_final[c[0]] = c[1]
            prediction_data_final1.append(c[0])
        
        data_output = {"data":[]}  # --> {course1:{}}
        for ID in prediction_data_final1:
               try:
                   data_output["data"].append(all_data[ID][0]) 
               except:
                   for element in all_data:
                       if all_data[element][0]["Act_ID"] == ID:
                           data_output["data"].append(all_data[element][0])
                       else:
                           pass
        
        return Response(data_output)

    
    
