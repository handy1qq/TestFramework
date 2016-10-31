//
//  IRequestPosInteface.h
//  PosInterfaceTest
//
//  Created by owen on 15/12/14.
//  Copyright © 2015年 com.company. All rights reserved.
//



#import <Foundation/Foundation.h>

@protocol IRequestPosIntefaceDelegate <NSObject>



@optional
//23.监听是否断开  当机具主动断开连接(功能断开  关机  突然关机的)都要回调一下该方法
/**
 *  监听是否断开
 */
-(void)listenBTConnectClosed;

@end


@interface IRequestPosInteface : NSObject

@property(weak, nonatomic) id<IRequestPosIntefaceDelegate> delegate;


+(IRequestPosInteface *) sharedIRequestPosInteface;




/**
 * 1 打开设备
 *
 *  @param intCommunicationMode Pos通讯模式, 0：音频通讯模式, 1：蓝牙通讯模式, 2：预留
 *  @param strParamValue        如果为蓝牙通讯模式，此参数为蓝牙MAC地址，音频模式为“”
 *  @param intTimeOut           单位毫秒，超时时间
 *  @param completion           打开成功回调
 *  @param error                打开失败回调
 */
-(void)requestOpenDevice:(int)intCommunicationMode andParam:(NSString *)strParamValue andTimeOut:(int)intTimeOut success:(void(^)(BOOL blnIsOpenSuc)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;




/**
 * 2 关闭设备
 *
 *  @param completion 关闭成功回调
 *  @param error      关闭失败回调
 */
-(void)requestCloseDevice:(void(^)()) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;





/**
 *  3 获得机具流水号
 *
 *  @param intPosType 设备类型
 *  @param intTimeOut 超时
 *  @param completion 成功回调
 *  @param error      失败回调
 */
-(void)requestDeviceTrace:(int)intPosType andTimeOut:(int)intTimeOut success:(void(^)(NSString * strTrace)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;





/**
 *  4 获取设备硬件序列号
 *
 *  @param intPosType POS机类型,如无多种类型，此参数可不处理
 *  @param intTimeOut 单位毫秒，超时时间
 *  @param completion 获取成功调用
 *  @param error      获取失败调用
 */
-(void)requestDeviceSN:(int)intPosType andTimeOut:(int)intTimeOut success:(void(^)(NSString *strSNCode,NSString *strPNCode,BOOL isWorkLoad,NSString *strAPPVersion,NSString *strCompanyId,NSString *strProductId)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;




/**
 * 5 获取设备信息
 *
 *  @param intPosType POS机类型,如无多种类型，此参数可不处理
 *  @param intTimeOut 单位毫秒，超时时间
 *  @param completion 获取成功回调
 *  @param error      获取失败回调
 */
-(void)requestDeviceInfo:(int)intPosType andTimeOut:(int)intTimeOut success:(void(^)(NSString *strChipCode,NSString *strTerminalNum)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;





/**
 *  6 POS签到
 *
 *  @param intPosType  Pos类型,如无多种类型，此参数可不处理
 *  @param intKeyIndex 密钥索引，签到时对应服务器工作密钥索引，并标识当前工作密钥状态，此后交易，都使用此套密钥分散后进行加解密，如无多套密钥，此参数固定为1
 *  @param strChipCode 加密芯片或PSAM序列号
 *  @param strEncData  工作密钥（pin，mac）密文及对应校验码16字节PIN+3校验+16字节mac+3校验
                        校验说明：常规校验
                        如密钥明文为：8964ABC6709AA346AABBCCDDEEFFAABB
                        CV=3DES(8964ABC6709AA346AABBCCDDEEFFAABB, 0000000000000000)= DF868597B1D5C28B;
                        CV=SUB_LEFT4BIT(CV);
                        CV= DF868597
 *  @param intTimeOut  超时时间
 *  @param completion  签到成功回调
 *  @param error       签到失败回调
 */
-(void)requestPosSignUp:(int)intPosType andKeyIndex:(int)intKeyIndex andChipCode:(NSString *)strChipCode andEncData:(NSString *)strEncData andTimeOut:(int)intTimeOut success:(void(^)(BOOL blnIsSignUpSuc)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;





/**
 *  7 获取磁卡信息    strFormatID 空 是磁条卡 ICCard是IC卡   NCCard 是非接
 *
 *  @param intPosType       POS机类型
 *  @param tdk2             TDK密钥后半段密文,8字节
 *  @param strTradeCash     金额 如“999 999 99.99”
 *  @param intTimeOut       总操作超时时间
 *  @param strSensitiveData 预留敏感数据
 *  @param completion       获取成功回调
 *  @param error            获取失败回调
 */
-(void)requestCardSwiper:(int)intPosType andTDK2:(NSString *)tdk2 andTradeCash:(NSString *)strTradeCash andTimeOut:(int)intTimeOut andSensitiveData:(NSString *)strSensitiveData success:(void(^)(NSString *strFormatID,NSString *strChipCode,NSString *strTerminalNum,NSString *strEncTracks1,NSString *strEncTracks2,NSString *StrEncTracks3,NSString *strEncPin,NSString *tdk,NSString *strPAN,NSString *strValidData,NSString *strCardHolderName,NSString *strTrace,NSString *strMac)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;




/**
 *  //8.非接调用接口
 *
 *  @param intPosType          <#intPosType description#>
 *  @param mercid              用户id
 *  @param usercode            用户名
 *  @param flag                标记是否ic卡
 *  @param strAuthorizedAmount <#strAuthorizedAmount description#>
 *  @param intTimeOut          <#intTimeOut description#>
 *  @param completion          <#completion description#>
 *  @param error               <#error description#>
 */
- (void)NOContactStart:(int)intPosType andMercId:(NSString *)mercid andUsercode:(NSString *)usercode andFlag:(NSString *)flag andAuthorizedAmount:(NSString *)strAuthorizedAmount andTimeOut:(int)intTimeOut success:(void(^)(BOOL flag,NSString *errorMsg,NSString *strPAN)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;







/**
 *  9 获取卡号明文
 *
 *  @param intPosType POS机类型
 *  @param intTimeOut 超时时间
 *  @param completion 获取成功回调
 *  @param error      获取失败回调
 */
-(void)requestGetCardCode:(int)intPosType andTimeOut:(int)intTimeOut success:(void(^)(NSString *strCardCode)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;





/**
 *  10 摘要加密
 *
 *  @param arrMacData 待加密数据
 *  @param intTimeOut 超时时间
 *  @param completion 加密成功回调
 *  @param error      加密失败回调
 */
-(void)requestMacDataEnc:(NSString *)arrMacData andTimeOut:(int)intTimeOut success:(void(^)(NSString *strEncMacData)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;





/**
 *  11 数据加密
 *
 *  @param bytArrData 待加密数据
 *  @param completion 加密成功回调
 *  @param error      加密失败回调
 */
-(void)requestDataEnc:(NSString *)bytArrData success:(void(^)(NSString *strEncData)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;




/**
 *  12 小票打印
 *
 *  @param strArrPrintContent <#strArrPrintContent description#>
 *  @param intTimeOut         <#intTimeOut description#>
 *  @param completion         <#completion description#>
 *  @param error              <#error description#>
 */
-(void)requestPrintData:(NSArray *)strArrPrintContent andTimeOut:(int)intTimeOut success:(void(^)(BOOL blnIsPrintOk)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;




/**
 *  13 参数更新请求
 *
 *  @param intPosType   POS机类型
 *  @param intParamType POS参数类型 0: AID参数； 1:公钥参数
 *  @param byteICParam  AID及公钥参数数据
 *  @param TimeOut      超时时间
 *  @param completion   请求成功回调
 *  @param error        请求失败回调
 */
-(void)emvUpdateParam:(int)intPosType andParamType:(int)intParamType andICParam:(NSString *)byteICParam andTimeOut:(int)TimeOut success:(void(^)(BOOL blnIsUpdateOK)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;




/**
 *  14 发起EMV流程(IC卡)
 *
 *  @param intPosType          POS机类型
 *  @param intTransType        EMV交易类型，2位十进制数字，对应于tag9C的值，00为消费
 *  @param strAuthorizedAmount 授权金额，如“99.99”
 *  @param strOtherAmount      其他金额，如“99.99”
 *  @param strDate             交易日期，此参数忽略
 *  @param strTime             交易时间，此参数忽略
 *  @param blnIsStdPBOC        是否是标准PBOC流程:“1”完整流程，“0”简易流程
 *  @param intTimeOut          超时时间
 *  @param completion          发起成功回调
 *  @param error               发起失败回调
 */
-(void)emvStart:(int)intPosType andTransType:(int)intTransType andAuthorizedAmount:(NSString *)strAuthorizedAmount andOtherAmount:(NSString *)strOtherAmount andDate:(NSString *)strDate andTime:(NSString *)strTime andISStdPBOC:(BOOL)blnIsStdPBOC
     andTimeOut:(int)intTimeOut success:(void(^)(NSString *strChipCode,NSString *strTerminalNum,NSString *strEncTracks2,NSString *strEncPin,NSString *strTDKCiphertext,NSString *strPAN,NSString *strCardSequence,NSString *resultBytes,NSString *strTrace,NSString *mac)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;






/**
 *  15 联机数据处理(IC卡)
 *
 *  @param intPosType POS机类型
 *  @param strFiled55 55域数据
 *  @param intTimeOut 超时时间
 *  @param completion 处理成功回调
 *  @param error      处理失败回调
 */
-(void)emvOnlineDataProcess:(int)intPosType andFiled55:(NSString *)strFiled55 andTimeOut:(int)intTimeOut success:(void(^)(NSString *resultBytes,NSString *strScriptResult)) completion error:(void(^)(BOOL isNeedReversal, NSString *strStausCode,NSString *strMsgInfo))error;





/**
 *  16 终止EMV流程(IC卡)
 *
 *  @param completion 终止成功回调
 *  @param error      终止失败回调
 */
-(void)emvStop:(void(^)()) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;






/**
 *  17 创建记录文件
 *
 *  @param recordName   文件名
 *  @param recordLength 记录长度
 *  @param completion   创建成功回调
 *  @param error        创建失败回调
 */
-(void)initRecord:(NSString *)recordName andRecodeLength:(int)recordLength success:(void(^)(BOOL isOK)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;




/**
 *  18 增加文件记录
 *
 *  @param recordName 文件名
 *  @param record     记录数据
 *  @param completion 增加成功回调
 *  @param error      增加失败回调
 */
-(void)addRecord:(NSString *)recordName andRecord:(NSString *)record success:(void(^)(BOOL isOK)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;



/**
 *  19 更新文件记录
 *
 *  @param recordName 文件名
 *  @param recordNo   记录号
 *  @param record     记录数据
 *  @param completion 更新成功回调
 *  @param error      更新失败回调
 */
-(void)UpdateRecord:(NSString *)recordName andRecordNo:(int)recordNo andRecord:(NSString *)record success:(void(^)(BOOL isOK)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;






/**
 *  20 读取文件记录
 *
 *  @param recordName 文件名
 *  @param recordNo   记录号
 *  @param completion 读取成功回调
 *  @param error      读取失败回调
 */
-(void)readRecord:(NSString *)recordName andRecordNo:(int)recordNo success:(void(^)(BOOL isOK,NSString *record)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;





/**
 *  21 手机取消POS操作
 *
 *  @param intParamType POS机类型
 *  @param intTimeOut   超时时间
 *  @param completion   取消成功回调
 *  @param error        取消失败回调
 */
-(void)requestCancelSwipeCard:(int)intParamType andTimeOut:(int)intTimeOut success:(void(^)(BOOL isOK)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;





/**
 *  22 获取与机具的链接状态  yes 链接状态  false 是断开状态
 *
 *  @return yes 链接状态  false 是断开状态
 */
-(BOOL)requestConnectState;




/**
 *  23 取消对机具操作
 *
 *  @param intPosType <#intPosType description#>
 *  @param intTimeOut <#intTimeOut description#>
 *  @param completion <#completion description#>
 *  @param error      <#error description#>
 */
-(void)requestTransCancel:(int)intPosType andTimeOut:(int)intTimeOut success:(void(^)(BOOL blnIsCancelSuc)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;






/**
 *  24	显示余额
 *
 *  @param cash       <#cash description#>
 *  @param showTime   显示时间，单位为秒
 *  @param completion 读取成功回调
 *  @param error      读取失败回调
 */
- (void) requestShowCash:(NSString *)cash showTime:(NSString *)showTime success:(void(^)(BOOL isOK)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;




//25.更新固件，filePath文件路径
- (void) requestUpdateFirmware:(NSString*)filePath completeBlock:(void(^)(BOOL blnIsCancelSuc)) completion  progressBlock:(void(^)(unsigned int current,unsigned int total))downloadProgressCB error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;



/*26
 返回值
 true为存在需要冲正交易；
 false为不存在需要冲正交易；
 */
-(BOOL)requestIsNeedReversal;



/**
 *  27 保存冲正信息
 *
 *  @param reversalString 要保存的冲正数据
 *  @param count          冲正重发次数，1~3次，如果超过3次按3次算
 *  @param completion     completion description
 *  @param error          error description
 */
- (void) requestWriteReversalString:(NSString *)reversalString count:(NSString *)count success:(void(^)(BOOL isOK)) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;




/**
 *  28	读冲正信息
 *
 *  @param reversalString 要保存的冲正数据
 *  @param residualCount  剩余冲正重发次数，0~2次，不包括本次，没调用一次减一，减到0后POS自动删除冲正文件
 *  @param completion     <#completion description#>
 *  @param error          error description
 */
- (void) requestReadReversalString:(void(^)( NSString *reversalString, NSString *residualCount )) completion error:(void(^)(NSString *strStausCode,NSString *strMsgInfo))error;



/**
 *  29	清除正信息
 *
 *  @param isOK 冲正是否成功‘1’成功，‘0’失败，POS此参数忽略
 */
- (void)requestResetIsNeedReversal:(Boolean)isOK;









@end












