// this is the class that takes the user's UID.
class UserLogin
{
  String uid;
  UserLogin({this.uid});
}

// this is the class that takes the user's data.
class UserData
{
  String username;
  String displayIconUrl;
  String race;
  String job;
  String gender;

  double level;
  double expPts;
  double statPts;

  double baseHP;
  double baseMP;
  double baseStr;
  double baseInt;
  double baseAgi;

  double modHP;
  double modMP;
  double modStr;
  double modInt;
  double modAgi;

  double currHP;
  double currMP;

  String skill1;
  String skill2;
  String skill3;
  String skill4;

  double gold;
  String headgear;
  String bodygear;
  String gloves;
  String footwear;
  String invSlot1;
  String invSlot2;
  String invSlot3;
  String invSlot4;

  UserData({
    this.username,
    this.displayIconUrl,
    this.race,
    this.job,
    this.gender,

    this.level,
    this.expPts,
    this.statPts,

    this.baseHP,
    this.baseMP,
    this.baseStr,
    this.baseInt,
    this.baseAgi,

    this.modHP,
    this.modMP,
    this.modStr,
    this.modInt,
    this.modAgi,

    this.currHP,
    this.currMP,
    this.skill1,
    this.skill2,
    this.skill3,
    this.skill4,

    this.gold,
    this.headgear,
    this.bodygear,
    this.gloves,
    this.footwear,
    this.invSlot1,
    this.invSlot2,
    this.invSlot3,
    this.invSlot4
    });
}