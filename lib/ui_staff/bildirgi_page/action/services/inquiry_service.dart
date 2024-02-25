import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui_staff/staff_home_page/model/inquiry_list_model.dart';

part 'inquiry_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class InquiryService extends ChopperService {
  static InquiryService create([ChopperClient? client]) =>
      _$InquiryService(client ?? ChopperClient());

  // self explanatory
  // @Get(path: 'types/inquiry_status?variable=inquiry_status')
  // Future<Response<List<InquiryButtons>>> getButtons();
  //post inquiry
  // @Post(path: '${AppStrings.inquiry}/')
  // Future<Response<InquiryListItemResponse>> postNewInquiry(@Body() CreateInquiryRequest body);
  // //get comments template
  // @Get(path: '${AppStrings.inquiry}/comment-template/')
  // Future<Response<List<CommentsResponse>>> getCommentsList();
  // //post comment
  // @Post(path: '${AppStrings.inquiry}/comment-template/')
  // Future<Response<CommentsResponse>> postComment(@Body() CommentsModelRequest body);
  // //get one inquiry only for read
  // @Get(path: '${AppStrings.inquiry}/{id}')
  // Future<Response<InquiryListItemResponse>> getInquiryById(@Path('id') int id);
  // //get one inquiry only for edit
  // @Get(path: '${AppStrings.inquiry}/{id}')
  // Future<Response<InquiryListItemResponse>> getInquiryByIdForEdit(@Path('id') int id);
  // @Post(path: '${AppStrings.inquiry}/')
  // Future<Response<InquiryListItemResponse>> editInquiryByID(@Body() CreateInquiryRequest model);
  // //update single inquiry
  // @Post(path: '${AppStrings.inquiry}/update-status')
  // Future<Response<InquiryListItemResponse>> postInquiry(@Body() InquiryActionRequestModel model);
  // //delete inquiry by its id
  // @Delete(path: '${AppStrings.inquiry}/mobile/{id}')
  // Future<Response<DeleteInquiryByIdModel>> deleteInquiryById(@Path('id') int id);

  //   --- pageable assigned ---   //

  @Get(path: AppStrings.orders)
  Future<Response<InquiryListResponse>> getInitiallyAssigned();

  // @Get(path: '${AppStrings.inquiry}/assigned?page={page}&size=20')
  // Future<Response<InquiryListResponse>> getAssignedWithPageable(@Path('page') int id);

  //   --- pageable assigned ---   //

  // @Get(path: '${AppStrings.inquiry}/')
  // Future<Response<InquiryListResponse>> getInitiallyCreated();

  // @Get(path: '${AppStrings.inquiry}/?page={page}&size=20')
  // Future<Response<InquiryListResponse>> getCreatedWithPageable(@Path('page') int id);
}
