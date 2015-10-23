package com.ito.edito.ejb.Wechat;

import javax.ejb.EJBObject;
import javax.ejb.Remote;

/**
 * <p>
 * <b>Wechat_EJB的远程接口文件</b>
 * </p>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

@Remote
public interface WechatServiceRemote extends WechatService, EJBObject {
}
