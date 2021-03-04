import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_reader/providers/db_providers.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL( BuildContext context ,  ScanModel scan ) async =>
    
    scan.tipo == 'http' 
    ?
      await canLaunch( scan.valor ) 
      ? await launch(scan.valor) 
      : throw 'Could not launch $scan.valor'
    :
      Navigator.pushNamed(context , 'mapa' , arguments: scan );