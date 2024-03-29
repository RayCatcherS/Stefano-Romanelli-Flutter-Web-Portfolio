import 'projectItemData.dart';

class ProjectGroup {

  late final String _projectsGroupName;
  late final String _projectsGroupDescription;
  late final List<ProjectItemData> _projectItemDataList;
  ProjectGroup(String projectGroupName, String projectsGroupDescription, List<ProjectItemData> projectItemDataList) {
    _projectsGroupName = projectGroupName;
    _projectsGroupDescription = projectsGroupDescription;
    _projectItemDataList = projectItemDataList;
  }
  ProjectGroup.fromJson(dynamic data) {
    _projectsGroupName = data["projectGroupName"];
    _projectsGroupDescription = data["projectGroupDescription"];
    _projectItemDataList = [];
    for(int i = 0; i < data["projectItemsData"].length; i++) {

      ItemType itemType = ItemType.image; 
      if(data["projectItemsData"][i]["itemType"] == "ItemType.urlImage") {
        itemType = ItemType.image;
      } else if(data["projectItemsData"][i]["itemType"] == "ItemType.urlImagePlayableReference") {
        itemType = ItemType.imagePlayableReference;
      } else if(data["projectItemsData"][i]["itemType"] == "ItemType.urlVideo") {
        itemType = ItemType.video;
      } else if(data["projectItemsData"][i]["itemType"] == "ItemType.youTubeVideo") {
        itemType = ItemType.youTubeVideo;
      }

      Company company = Company(
        companyName: data["projectItemsData"][i]["company"]['companyName'],
        companyURL: data["projectItemsData"][i]["company"]['companyUrl']
      );
      
      ItemCoverBackgroundType itemCoverBackgroundType = ItemCoverBackgroundType.image;
      if(data["projectItemsData"][i]["itemCoverBackgroundType"] == "image") {
        itemCoverBackgroundType = ItemCoverBackgroundType.image;
      } else {
        itemCoverBackgroundType = ItemCoverBackgroundType.video;
      }

      List<CallToAction> callToActions = [];
      for(int j = 0; j < data["projectItemsData"][i]["callToActions"].length; j++) {
        callToActions.add(
          CallToAction(
            callToActionText: data["projectItemsData"][i]["callToActions"][j]["callToActionText"],
            callToActionUrl: data["projectItemsData"][i]["callToActions"][j]["callToActionUrl"]
            )
        );
      } 
      _projectItemDataList.add(
        ProjectItemData(
          mediaPreviewUrl: data["projectItemsData"][i]["mediaPreviewUrl"],
          imagePlayableReferenceUrl: data["projectItemsData"][i]["imagePlayableReferenceUrl"],
          callToAction: callToActions,

          title: data["projectItemsData"][i]["title"],
          description: data["projectItemsData"][i]["description"],
          gameAssetImageUrl: data["projectItemsData"][i]["gameAssetImageUrl"],
          itemType: itemType,
          professionalRoles: data["projectItemsData"][i]["professionalRoles"],
          platforms: data["projectItemsData"][i]["platforms"],
          company: company,

          backgroundType: itemCoverBackgroundType,
          backgroundCoverImageUrl: data["projectItemsData"][i]["backgroundCoverImageUrl"],
          backgroundCoverVideoUrl: data["projectItemsData"][i]["backgroundCoverVideoUrl"])
      );
    }
  }

  // getter
  List<ProjectItemData> get projectItemDataList {
    return _projectItemDataList;
  }
  String get projectGroupName {
    return _projectsGroupName;
  }
  String get projectGroupDescription {
    return _projectsGroupDescription;
  }

  // setters
  set projectItemDataList(List<ProjectItemData> list) {
    _projectItemDataList = list;
  }
  set projectGroupName(String s) {
    _projectsGroupName = s;
  }
  set projectGroupDescription(String s) {
    _projectsGroupDescription = s;
  }
}