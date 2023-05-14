from django.contrib import admin
from django.urls import path, include
from .views import CountMeInCoursesContentBased,CountMeInCoursesModelBased,CountMeInActivityContentBased,CountMeInActivityModelBased
from .views import CountMeInWorkshopContentBased, CountMeInWorkshopModelBased, CountMeInApi
urlpatterns = [
    path('admin/', admin.site.urls),
    path('api-auth/',include('rest_framework.urls')),
    path('',CountMeInApi.as_view(),name='countmein'),
    path('coursesCB/',CountMeInCoursesContentBased.as_view(),name='countmein'),
    path('coursesMB/',CountMeInCoursesModelBased.as_view(),name='countmein'),
    path('activityCB/',CountMeInActivityContentBased.as_view(),name='countmein'),
    path('activityMB/',CountMeInActivityModelBased.as_view(),name='countmein'),
    path('workshopCB/',CountMeInWorkshopContentBased.as_view(),name='countmein'),
    path('workshopMB/',CountMeInWorkshopModelBased.as_view(),name='countmein')
]
