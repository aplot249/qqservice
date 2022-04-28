# @author: sareeliu
# @date: 2022/4/27 0:06
import pymysql
from django.http import JsonResponse
from pymysql.cursors import DictCursor
import json

dbinfo = {
    'user': 'root',
    'password': 'qq1788lover',
    'port': 3306,
    'db': 'qqservice'
}


def getPhone(request):
    # print(request.GET['username'])
    try:
        usernamelist = request.GET['usernamelist']
        print(json.loads(usernamelist))
        conn = pymysql.connect(**dbinfo)
        c = conn.cursor(DictCursor)
        # c.executemany()
        sql = "select username,phone from user where "
        for i in json.loads(usernamelist):
            sql += f"username = '{i}' or "
        # print(sql[:-3])
        # quit()
        c.execute(sql[:-3])
        res = c.fetchall()
        print(res)
        conn.close()
    except:
        res = {'username': None, 'phone': None}

    return JsonResponse(res,safe=False)
