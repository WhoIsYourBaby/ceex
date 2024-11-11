/// 全局配置与变量命名，小写k开头

const kBaseDomain = "ceex.com";

/// h5静态域名
const kBaseH5Domain = "d1133sjcnebqrc.cloudfront.net";
// const kBaseDomain = "ceexcorp.com";

/// rest api base-url
const kApiBaseUrl = "https://app.${kBaseDomain}";

const kWsBaseUrl = "wss://ws.${kBaseDomain}/ws/quote/v1";

/// 渠道
const kAppChannel = "Enterprice";

/// 极验Key
const kGt3Gt = "d9b22c2488def2cfa35aa4b6a4cbe74d";

/// 人机校验 类型，1是google，2极验滑块
const kVerifyType = 2;

/// google Recaptcha 人机校验
const kRecaptchaUrl =
    "https://${kBaseH5Domain}/static/google_recaptcha_v3.html?siteKey=6LeSoDwpAAAAAE2n_QgXO8XF9G8nVUqlU7K4FUT9";

/** 【第二种】域名配置
 * 获取配置的接口：https://app.xxx.xxx/ms_api/basic/config_v2?type=all
 * @kOrgId     接口返回的【orgId】字段的value
 * @kDomainKey 接口返回的【responseRandomKey】字段的value
 * @kDomains   接口返回的【domains】字段的value
 * @kDomainUrl 单独获取域名列表数据接口【找商务申请】
 */
const kOrgId = "6066";
const kDomainKey = "ODPpWWDBVlESBQWrWurARNfToOSwLRwT";
const kDomainUrl = "";
const kDomains =
    "v1WV5HPcu5cMI13B55t0DK0LlwwhDV5YLPuVUX+i51ErLziQxkFQV2KMp39Y7bfO+Ty5oUDgqTrYzO4IeLBQjMJgT5hfBMjPaQrBVGfz3x/2TBaAJxZykPFNS+lcpchP";

/// zendesk
const kZendeskAppId = "fffe5cf1cf07308253c1b5ce5cf6a7645ec17843e82e9750";
const kZendeskClientId = "mobile_sdk_client_4520dae72274c226fdde";
const kZendeskUrl = "https://ceexglobal.zendesk.com";