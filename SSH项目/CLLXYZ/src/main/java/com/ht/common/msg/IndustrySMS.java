package com.ht.common.msg;

/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private static String smsContent1 = "【宏图科技】验证码：";
	private static String smsContent2 = "，如非本人操作，请忽略此短信。";

	/**
	 * 验证码通知短信
	 */
	public static void execute(String to, String verify)
	{
		String url = Config.BASE_URL + operation;
		String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + smsContent1 + verify
				+ smsContent2 + HttpUtil.createCommonParam();

		// 提交请求
		String result = HttpUtil.post(url, body);
		System.out.println("result:" + System.lineSeparator() + result);
	}
}
