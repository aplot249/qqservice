# @author: sareeliu
# @date: 2022/4/27 0:06
import pymysql
from django.http import JsonResponse
from pymysql.cursors import DictCursor

dbinfo = {
    'user': 'root',
    'password': 'qq1788lover',
    'port': 3306,
    'db': 'qqservice'
}


def getPhone(request):
    # print(request.GET['username'])
    try:
        username = request.GET['username']
        conn = pymysql.connect(**dbinfo)
        c = conn.cursor(DictCursor)
        c.execute(f"select username,phone from user where username = '{username}' ")
        res = c.fetchone()
        print(res)
        conn.close()
    except:
        res = {'username': None, 'phone': None}

    return JsonResponse(res)
