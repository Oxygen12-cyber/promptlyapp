import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aipromptapp/extensions/extension.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

OutlinedButton tagButton(VoidCallback? onPressed, String text) =>
    OutlinedButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        side: const BorderSide(color: Colors.transparent, width: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );

class PostBox extends StatelessWidget {
  final String title;
  final String? userProfile;
  final String subtitle;
  final String? username;
  final String? post;
  final String likes;
  final Function()? onTap;
  const PostBox({
    super.key,
    required this.title,
    required this.subtitle,
    this.post,
    this.username,
    this.userProfile,
    required this.likes,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          border: BoxBorder.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              // spreadRadius: 0.050,
              blurRadius: 0,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          children: [
            //title and subtitle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: loadRandomColor(),
                          foregroundImage: AssetImage(
                            userProfile ?? 'assets/images/profile_pic.png',
                          ),
                          radius: 24,
                        ),
                        Text(
                          username ?? 'Username',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 10),
                      child: Expanded(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: title,
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '\n$subtitle',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //chip
                    Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      label: Row(
                        children: [
                          Text(
                            'gpt-5',
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5, bottom: 5),
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.lightGreenAccent,
                      shadowColor: Colors.transparent,
                    ),
                    SizedBox(height: context.hp(1)),
                    //like icon and text and seen icon and text
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          spacing: 4,
                          children: [
                            const Icon(Iconsax.like, color: Colors.black54),
                            Text(
                              likes,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            const Icon(Iconsax.eye, color: Colors.black54),
                            Text(
                              likes,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    child: Text(
                      post ??
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomActionChip extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomActionChip({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Iconsax.export_1, size: 14, color: Colors.deepPurple),
        ],
      ),
      onPressed: () {
        debugPrint('$label button clicked');
        onPressed();
      },
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.deepPurpleAccent, width: 1.5),
      ),
      elevation: 0,
      pressElevation: 1,
    );
  }
}
