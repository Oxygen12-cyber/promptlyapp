import 'package:aipromptapp/components/component.dart';
import 'package:aipromptapp/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class PostPage extends ConsumerStatefulWidget {
  final String? postTitle;
  final String? postDescription;
  final String? likes;
  final String? views;
  final String? username;
  final String? postBody;
  final String? postTag;
  final String? llmModel;
  final String? createdDate;

  const PostPage({
    super.key,
    this.postTitle,
    this.postDescription,
    this.likes,
    this.views,
    this.username,
    this.postBody,
    this.postTag,
    this.llmModel,
    this.createdDate,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Iconsax.arrow_left_2_copy,
            size: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.hp(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: widget.postTitle,
                        style: GoogleFonts.ubuntuSans(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '\n${widget.postTag}',
                            style: GoogleFonts.ubuntuSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          TextSpan(
                            text: '\n@${widget.username}',
                            style: GoogleFonts.ubuntuSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            const Text('gpt-5'),
                            Container(
                              margin: const EdgeInsets.only(left: 5, bottom: 5),
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        padding: const EdgeInsets.all(7),
                        backgroundColor: Colors.lightGreenAccent,
                        shadowColor: Colors.transparent,
                      ),
                      SizedBox(height: context.hp(1)),
                      //like icon and text and seen icon and text
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            spacing: 4,
                            children: [
                              Text(
                                widget.likes ?? '164',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Icon(Iconsax.like, color: Colors.black54),
                            ],
                          ),
                          Row(
                            spacing: 4,
                            children: [
                              Text(
                                widget.views ?? '12.2k',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Icon(Iconsax.eye, color: Colors.black54),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: context.hp(4)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: context.hp(40),
                  width: context.wp(100),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.black54,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Prompt',
                                  style: GoogleFonts.poppins(
                                    color: Colors.deepPurple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Tooltip(
                                  message: 'Copy',
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Iconsax.copy),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          color: Colors.transparent,
                          child: SingleChildScrollView(
                            child: Text(
                              widget.postBody ??
                                  '    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.hp(2)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Open with',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    CustomActionChip(label: 'ChatGPT', onPressed: () {}),
                    CustomActionChip(label: 'Gemini', onPressed: () {}),
                    CustomActionChip(label: 'Claude', onPressed: () {}),
                    CustomActionChip(label: 'Llama', onPressed: () {}),
                    CustomActionChip(label: 'Copilot', onPressed: () {}),
                  ],
                ),
              ),
              SizedBox(height: context.hp(4)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Prompt Details',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 0,
                color: Colors.grey.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.postDescription ?? 'No description available',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Iconsax.text,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${widget.postBody?.split(' ').length ?? 0} words',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 24),
                          Row(
                            children: [
                              const Icon(
                                Iconsax.calendar_1,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                widget.createdDate ?? 'Unknown date',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.hp(5)),
            ],
          ),
        ),
      ),
    );
  }
}
