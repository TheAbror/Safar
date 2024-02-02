// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$InquiryService extends InquiryService {
  _$InquiryService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = InquiryService;

  @override
  Future<Response<List<InquiryButtons>>> getButtons() {
    final Uri $url = Uri.parse(
        'https://api.edulab.app/edulab_udea/api/v1/types/inquiry_status?variable=inquiry_status');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<InquiryButtons>, InquiryButtons>($request);
  }

  @override
  Future<Response<InquiryListItemResponse>> postNewInquiry(
      CreateInquiryRequest body) {
    final Uri $url =
        Uri.parse('https://api.edulab.app/edulab_udea/api/v1/inquiry/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<InquiryListItemResponse, InquiryListItemResponse>($request);
  }

  @override
  Future<Response<List<CommentsResponse>>> getCommentsList() {
    final Uri $url = Uri.parse(
        'https://api.edulab.app/edulab_udea/api/v1/inquiry/comment-template/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CommentsResponse>, CommentsResponse>($request);
  }

  @override
  Future<Response<CommentsResponse>> postComment(CommentsModelRequest body) {
    final Uri $url = Uri.parse(
        'https://api.edulab.app/edulab_udea/api/v1/inquiry/comment-template/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CommentsResponse, CommentsResponse>($request);
  }

  @override
  Future<Response<InquiryListItemResponse>> getInquiryById(int id) {
    final Uri $url =
        Uri.parse('https://api.edulab.app/edulab_udea/api/v1/inquiry/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<InquiryListItemResponse, InquiryListItemResponse>($request);
  }

  @override
  Future<Response<InquiryListItemResponse>> getInquiryByIdForEdit(int id) {
    final Uri $url =
        Uri.parse('https://api.edulab.app/edulab_udea/api/v1/inquiry/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<InquiryListItemResponse, InquiryListItemResponse>($request);
  }

  @override
  Future<Response<InquiryListItemResponse>> editInquiryByID(
      CreateInquiryRequest model) {
    final Uri $url =
        Uri.parse('https://api.edulab.app/edulab_udea/api/v1/inquiry/');
    final $body = model;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<InquiryListItemResponse, InquiryListItemResponse>($request);
  }

  @override
  Future<Response<InquiryListItemResponse>> postInquiry(
      InquiryActionRequestModel model) {
    final Uri $url = Uri.parse(
        'https://api.edulab.app/edulab_udea/api/v1/inquiry/update-status');
    final $body = model;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<InquiryListItemResponse, InquiryListItemResponse>($request);
  }

  @override
  Future<Response<DeleteInquiryByIdModel>> deleteInquiryById(int id) {
    final Uri $url = Uri.parse(
        'https://api.edulab.app/edulab_udea/api/v1/inquiry/mobile/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client
        .send<DeleteInquiryByIdModel, DeleteInquiryByIdModel>($request);
  }

  @override
  Future<Response<InquiryListResponse>> getInitiallyAssigned() {
    final Uri $url =
        Uri.parse('https://api.edulab.app/edulab_udea/api/v1/inquiry/assigned');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<InquiryListResponse, InquiryListResponse>($request);
  }

  @override
  Future<Response<InquiryListResponse>> getAssignedWithPageable(int id) {
    final Uri $url = Uri.parse(
        'https://api.edulab.app/edulab_udea/api/v1/inquiry/assigned?page=${id}&size=20');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<InquiryListResponse, InquiryListResponse>($request);
  }

  @override
  Future<Response<InquiryListResponse>> getInitiallyCreated() {
    final Uri $url =
        Uri.parse('https://api.edulab.app/edulab_udea/api/v1/inquiry/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<InquiryListResponse, InquiryListResponse>($request);
  }

  @override
  Future<Response<InquiryListResponse>> getCreatedWithPageable(int id) {
    final Uri $url = Uri.parse(
        'https://api.edulab.app/edulab_udea/api/v1/inquiry/?page=${id}&size=20');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<InquiryListResponse, InquiryListResponse>($request);
  }
}
