import 'package:get/get.dart';

import '../../widgets/snackbar.dart';
import '../routes/routes.dart';
import 'custom_exception.dart';
import 'package:flutter/material.dart';

abstract class DgMixing {

  Future<dynamic>  dgResponse(Future<dynamic> Function() exec, {Function? callback }) async {
    try{
      var result = await exec();
      if(callback != null){ await callback();}
      return result;
    }on BadRequestException catch(resp, cust) {
      if(resp.response['message'].runtimeType != String){
      failedSnack("Error",resp.response['message'][0]);
      }else{
      failedSnack("Error",resp.response['message'],);
      }
      return null;
    }on UnknownResource catch(resp, cust) {
      failedSnack("Failed",resp.response['message'],);
      return null;
    }
    on FetchDataException catch (resp,initial){
      failedSnack("Error",resp.response['message'],);
      return null;
    }
    on UnauthorisedException catch (resp,initial){
      failedSnack("Error",resp.response['message'],);
      return null;
    }

    on CustomException catch (resp,initial){
      failedSnack("Error",resp.response['message'],);
      return null;
    }
    catch(e){
      failedSnack("Error","Could not process your request at this time. Please try again later.",);
      return null;
    }
  }
}
