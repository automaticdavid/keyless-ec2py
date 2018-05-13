from flask import Flask, request
from flask_restplus import Resource, Api, fields, reqparse
import subprocess

__author__ = "David CLAUVEL"
__version__ = "1.0"
__status__ = "Concept Code"

app = Flask(__name__)
api = Api(app)
ns = api.namespace('api', description='Keyless API access to dynamic inventories')


''' Routes '''


@ns.route('/ec2.py', methods=['GET'])
class ListCollects(Resource):
    def get(self):
        # res =Ec2Inventory()
        # res = dyn_inventory_ec2.Ec2Inventory()
        # print("res", res) 
        # return {"yes": "ok"}
        res=subprocess.check_output("./ec2.py", stderr=subprocess.STDOUT)
        return(res)
