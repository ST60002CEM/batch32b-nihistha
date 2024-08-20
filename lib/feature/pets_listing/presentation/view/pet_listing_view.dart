
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoints.dart';
import '../view_model/pet_listing_view_model.dart';

class PetListingView extends ConsumerStatefulWidget {
  const PetListingView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetListingViewState();
}

class _PetListingViewState extends ConsumerState<PetListingView> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  bool hasMore = true;

  static const Color themeColor = Color(0xFF84D5D8);

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMorePosts() async {
    if (isLoading || !hasMore) return;
    setState(() {
      isLoading = true;
    });
    int nextPage = currentPage + 1;
    final result = await ref.read(petListingViewModelProvider.notifier).getPetListing(page: nextPage);
    if (result) {
      setState(() {
        isLoading = false;
        currentPage = nextPage;
      });
    } else {
      setState(() {
        isLoading = false;
        hasMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(petListingViewModelProvider);

    return Scaffold(
      backgroundColor: themeColor.withOpacity(0.1),
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Adopt',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextSpan(
                text: 'apet',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!isLoading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _loadMorePosts();
          }
          return true;
        },
        child: RefreshIndicator(
          color: themeColor,
          backgroundColor: Colors.white,
          onRefresh: () async {
            await ref.read(petListingViewModelProvider.notifier).resetState();
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      if (index < state.petListings.length) {
                        final petListings = state.petListings[index];
                        return ProductCard(
                          image: '${ApiEndpoints.imageBaseUrl}listings/${petListings.petImage}',
                          name: petListings.petName,
                          size: petListings.size,
                          onPressed: () {
                            ref.read(petListingViewModelProvider.notifier)
                                .openPetDetails(petListings.petid!);
                          },
                        );
                      } else if (hasMore) {
                        return Center(child: CircularProgressIndicator(color: themeColor));
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                    childCount: state.petListings.length + (hasMore ? 1 : 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String size;
  final String image;
  final VoidCallback onPressed;

  static const Color themeColor = Color(0xFF84D5D8);

  ProductCard({
    required this.name,
    required this.size,
    required this.image,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: themeColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                        color: themeColor,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.error, color: Colors.red));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    size,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    onPressed: onPressed,
                    child: Text('View Details'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}