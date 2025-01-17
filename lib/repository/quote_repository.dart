import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/model/quote/rate_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'quote_repository.g.dart';

/// 行情API
/// 参考文档URL：https://gitlab.ceex666.live/bhpc/docs/broker-api/-/blob/master/UserAPI/2%20%E8%A1%8C%E6%83%85%E6%8E%A5%E5%8F%A3.md#%E8%A1%8C%E6%83%85api

@RestApi()
abstract class QuoteRepository {
  factory QuoteRepository(Dio dio, {String baseUrl}) = _QuoteRepository;

  /// 聚合k线
  @GET("/api/quote/v1/multi/kline")
  Future<HttpResponse<Map<String, List<KlineModel>?>>> multiKline(
    @Queries() MultiKlineQuery queries,
  );

  /// k线
  @GET("/api/quote/v1/klines")
  Future<HttpResponse<ApiResponse<List<KlineModel>?>>> getKlines(
    @Queries() KlineQuery queries,
  );

  /// 汇率查询
  /// legalCoins	BTC,CNY,USD,KRW,JPY,VND,USDT
  /// org_id	6066
  /// sig	2b9232e1ee0ff7c34976cf66e47227fd
  /// time	1709366335000
  /// tokens	0X0,10GET,10SET,1INCH,3HYDRA,3ULL,AAVE,ABBC,ABT,ACA,ACE,ACH,ACM,ACX,ADA,ADF,ADS,ADX,AERGO,AEUR,AFC,AFG,AGI,AGIX,AGLA,AGLD,AHT,AI,AIDOGE,AIOZ,AIPAD,AITECH,AKITA,AKRO,AKT,ALCX,ALEPH,ALEX,ALGB,ALGO,ALI,ALPACA,ALPHA,ALPINE,ALT,ALU,AMB,AMO,AMP,AMPL,AMU,ANALOS,ANKR,ANKRETH,ANT,AOG,APE,API3,APP,APT,APX,AQT,AR,ARB,ARDR,ARG1,ARPA,ARRR,ASD,ASM,AST,ASTR,ASTRAFER,ATA,ATLAS,ATM,ATOM,ATOM-ARC,ATOR,AUCTION,AUDIO,AURA,AURY,AVA,AVAX,AVINOC,AVT,AXEL,AXL,AXS,AZERO,AZIT,BAD,BADGER,BAKE,BANANA,BAND,BAR,BAT,BAX,BBF,BBL,BCD,BCH,BCUT,BDX,BEAM,BEL,BEND,BETA,BFIC,BGB,BICO,BIDR,BIFI,BIGTIME,BITCI,BLOK,BLUR,BLZ,BMX,BNB,BNC,BNT,BNX,BOBA,BOND,BONE,BOO,BORA,BORG,BOSON,BOTTO,BRISE,BRN,BSCPAD,BST,BSV,BSW,BTC,BTCB,BTCD,BTCP,BTCU,BTCXT,BTG,BTM,BTRST,BTS,BTT,BURGER,BWO,BXC,BZR,BZZ,C98,CAGA,CAKE,CAPS,CAST,CATGIRL,CBETH,CBK,CC,CCD,CDT,CEEK,CEL,CELR,CENNZ,CERE,CET,CETUS,CEUR,CFG,CFX,CGO,CGPT,CHEEL,CHEQ,CHESS,CHNG,CHR,CHZ,CITY,CKB,CLORE,CLV,COL,COMBO,COMP,CON,CONX,COQ,CORE,COS,COT,COVAL,CPOOL,CQT,CRE,CREAM,CREO,CRO,CRTS,CRU,CRV,CSIX,CSPR,CTC,CTK,CTSI,CTX,CUBE,CULT,CUSD,CVC,CVP,CVTX,CWEB,DAG,DAI,DAR,DASH,DATA,DC,DCB,DEFI,DEGO,DEL,DENT,DEP,DERC,DERO,DESO,DEXE,DEXT,DF,DFG,DFI,DFL,DG,DGB,DIA,DIME,DIMO,DIO,DIONE,DIP,DIVI,DKA,DLC,DMAIL,DMD,DMTR,DNT,DNX,DOCK,DODO,DOGE,DOME,DORA,DOT,DPI,DPR,DREP,DUSK,DUST,DVF,DVI,DVPN,DYM,EDGT,EDU,EFI,EGG,EGLD,ELA,ELF,EMC,EML,ENJ,EOS,EPIK,EPS,ERC20,ERG,ERN,ETC,ETH,ETHAX,ETHDYDX,ETHW,ETN,EURC,EURS,EURT,EVA,EVER,EWT,EXRD,FARM,FCT,FDUSD,FEI,FET,FIDA,FIL,FIO,FIRE,FIRO,FIS,FITFI,FLEX,FLIX,FLM,FLOKI,FLOW,FLR,FLUX,FNCY,FNSA,FOR,FORT,FORTH,FORWARD,FOX,FPS,FRA,FRAX,FRM,FRONT,FSN,FTM,FTN,FTT,FUL,FUN,FUSE,FX,FXS,GAL,GALA,GARI,GAS,GBYTE,GEL,GENE,GF,GFAL,GFI,GFT,GG,GHST,GMEE,GMM,GMT,GMX,GNS,GODS,GOG,GRND,GROW,GRS,GRT,GRV,GST,GSWIFT,GT,GTAI,GTC,GUSD,GXA,GYEN,GZONE,H2O,HAI,HAPI,HARD,HBAR,HBTC,HDN,HEGIC,HELLO,HERO,HEX,HEZ,HFT,HGPT,HIFI,HIGH,HIVE,HNS,HNT,HOGE,HON,HONEY,HOOK,HOPR,HOT,HPO,HSF,HT,HTM,HTR,HTX,HUNT,HUSD,ICE,ICHI,ICP,ICX,ID,IDEX,IDIA,IDRT1,ILV,IMGNAI,IMX,INDY,INJ,INSP,INTER,INV,IOST,IOT,IOTA,IOTX,IQ,IRIS,ISK,ISLM,ISSP,IZI,JASMY,JESUS,JEWEL,JOY,JST,JTO,JUP,JUV,KAI,KAN,KAR,KAS,KASTA,KATA,KAVA,KCS,KDA,KEEP,KEY,KILT,KIN,KISHU,KLAY,KLV,KMA,KMD,KNC,KP3R,KRL,KSM,KSP,KUJI,KWD,KWENTA,KYVE,LA,LADYS,LAT,LAZIO,LCX,LDO,LEASH,LENDS,LEO,LEVER,LIKE,LINA,LINK,LIT,LITT,LMWR,LOCUS,LOKA,LON,LOOKS,LOOM,LPT,LQTY,LRC,LSD,LSK,LSS,LTC,LTO,LUNA,LUNC,LUSD,LYRA,LYX,LYXE,MAGIC,MAN,MANA,MANTA,MAP,MASK,MASQ,MATH,MATIC,MAVIA,MBL,MBS,MCADE,MCB,MCT,MDAO,MDEX,MDT,MED,MEME,MENGO,META,METIS,MEV,MIN,MINA,MIX1,MLK,MLN,MLT,MMIT,MNGO,MNT,MNW,MOB,MOBILE,MOC,MONA,MONG,MOON,MOZ,MPL,MPLX,MRS,MSOL,MTD,MTL,MTRG,MULTI,MUNITY,MUSE,MV3,MVL,MXC,MYRIA,MYRO,NAKA,NAVX,NCDT,NCT,NEAR,NEO,NEOM,NEON,NEST,NETVR,NETZ,NEXA,NEXO,NFP,NFT,NFTX,NIM,NIZA,NMC,NMR,NODL,NOIA,NOM,NPT,NTRN,NTX,NULS,NUM,NWC,NXRA,NYM,OAX,OBT,OCEAN,OG,OHO,OKB,OM,OMG,ONDO,ONG,ONIT,OOKI,OP,OPTI,OPUL,ORAI,ORBR,ORC,ORCA,ORDI,ORN,ORNJ,OSMO,OTK,OUSD,OXBT,OXEN101,OXT,OZO,PAID,PANDORA,PAW,PBX,PCX,PDEX,PDT,PENDLE,PEOPLE,PEPE20,PERP,PHA,PHB,PIB,PIP,PIT,PIVX,PIXEL,PKF,PLA,PLANET,PLU,PMG,PNG,PNK,PNT,POKT,POL,POLIS,POLY,POLYX,POND,POOLX,PORT3,PORTO,PPC,PRE,PRIME,PRO,PROM,PROPC,PROS,PRQ,PSG,PSP,PTS,PTU,PUNDIX,PUSH,PYR,PYTH,PYUSD,PZP,QI,QKC,QOM,QRDO,QRL,QTCON,QTUM,QUACK,QUICK,RACA,RAINI,RAMP,RARE,RARI,RAY,RBN,RBTC,RBX,RDNT,REEF,REI,REN,RENBTC,REP,REQ,RETH,REVV,RFOX,RIF,RISE,RKN,RLB,RLC,RLY,RMRK,RNDR,ROA,RON,ROSE,ROUTE,RPL,RSR,RSS3,RSV,RUNE,RVF,RVN,RXD,SAITO,SAMO,SAND,SANTOS,SAROS,SATS,SAVM,SBD,SC,SCLP,SCPT,SCRT,SD,SDAO,SDEX,SDN,SEI,SENATE,SFP,SHFT,SHIB,SHIDO,SHPING,SHRAP,SHX,SIDUS,SIS,SKL,SLIM,SLN,SLND,SLP,SMT,SN,SNEK,SNT,SNX,SOCKS,SOFI,SOL,SOLO,SOLVE,SOUL,SOV,SPA,SPACE,SPELL,SPH,SPS,SPURS,SQT,SRM,SSV,SSWP,SSX,STARL,STBU77,STC,STEEM,STEP,STETH,STFX,STG,STIK,STMX,STORJ,STOS,STPT,STRAX,STRD,STRK,STRX,STT,STX,SUI,SUKU,SUN,SURE,SUSD,SUSHI,SWAP,SWASH,SWEAT,SWTH,SYN,SYS,T,TABOO,TADA,TAMA,TAO,TARA,TBTC,TEL,TET,TFUEL,THETA,TIA,TIME,TKO,TKP,TLM,TLOS,TOKE,TOKEN,TOMI,TON,TONCOIN,TONIC,TORN,TOSHI,TPT,TRAC,TRADE,TRB,TRIAS,TRIBE,TRIX,TROY,TRU,TRVL,TRX,TSUGT,TSUKA,TT,TUNE,TURBO,TUSDT,TWT,UBT,UFC,UFO,UFT,ULTIMA,UMA,UNCX,UNFI,UNI,UNIBOT,UNIX,UNS,UOS,UPO6,UPP,UQC,USDC,USDD,USDE,USDJ,USDK,USDP,USDT,USDV,USDX,USTC,UTK,UX,VAI,VAL,VANRY,VBIT,VBNB,VBTC,VBUSD,VEGA,VELO,VET,VETH,VEXT,VGX,VIA,VIB,VIC,VIDT,VINU,VITE,VOLT,VOXEL,VR,VRA,VRSC,VRTX,VTHO,VTS,VUSDC,VUSDT,VVS,VXV,VXVS,WAGMIGAMES,WAIT,WAN,WAVES,WBETH,WBNB,WBTC,WE,WEMIX,WEN,WEOS,WHALES,WHBAR,WHITE,WIF,WIFI,WILD,WING,WKAVA,WLD,WMT,WNCG,WNT12,WNXM,WOMBAT,WOO,WORK,WRLD,WRX,WSM,WTRX,WWY,WXT,XAI,XCAD,XCH,XCN,XCP,XDB,XDC,XDEFI,XEC,XELS,XLM,XMR,XNA,XNO,XPR,XPRT,XRD,XRP,XSGD,XTM,XTZ,XVG,XVS,XWC,XYM,XYO,YFII,YGG,YLD,YOOSHI,ZANO,ZBC,ZEC,ZEON,ZETA,ZIG,ZIL,ZKF,ZKS,ZNN,ZRX,ZTX
  @POST("/api/quote/v1/rates")
  @FormUrlEncoded()
  Future<HttpResponse<ApiResponse<List<RateModel>?>>> rates(
    @Field() String legalCoins,
    @Field() String tokens,
  );


  /// depth
  @GET("/api/quote/v1/depth")
  Future<HttpResponse<ApiResponse<List<WsDiffDepthModel>?>>> getDepth(
    @Query("dumpScale") String dumpScale,
    @Query("limit") int limit,
    // exchangeId.symbol
    @Query("symbol") String symbol,
  );


  /// ticker
  @GET("/api/quote/v1/ticker")
  Future<HttpResponse<ApiResponse<List<KlineModel>?>>> getTicker(
    @Query("realtimeInterval") String realtimeInterval,
    // exchangeId.symbol
    @Query("symbol") String symbol,
  );

  /// ticker
  @GET("/api/quote/v1/trades")
  Future<HttpResponse<ApiResponse<List<WsTradeModel>?>>> getTrades(
    @Query("limit") String limit,
    // exchangeId.symbol
    @Query("symbol") String symbol,
  );
}