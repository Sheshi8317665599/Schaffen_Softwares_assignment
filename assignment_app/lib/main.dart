import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: CustomScrollViewExample(),
    );
  }
}

class CustomScrollViewExample extends StatefulWidget {
  const CustomScrollViewExample({super.key});

  @override
  State<CustomScrollViewExample> createState() =>
      _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  String content =
      'Sidharth Sriram (born 19 May 1990) is an Indian Carnatic musician, music producer, playback singer. He is an R&B songwriter and has been working in the Tamil, Telugu, Kannada, Malayalam, Hindi, Marathi and English music industry. He regularly collaborates with his sister Pallavi Sriram, a Bharatanatyam dancer, and music directors.Sid Sriram was born in Chennai, Tamil Nadu. He moved with his parents to California at the age of one, growing up in Fremont. His musical skills were nurtured by his mother, Latha Sriram, a Carnatic music teacher in the San Francisco Bay Area. He started learning Carnatic music since he was 3 years old.'
      'He simultaneously started picking up R&B. After graduating from Mission San Jose High School in 2008, he joined the Berklee College of Music and graduated in music production and engineering. After his graduation, he regularly visited India and performed in Carnatic concerts, including as a part of the December Music season - Marghazhi Utsavam and has since moved back to India and currently resides in the Mylapore area in Chennai.';

  bool _showSearchBox = false;

  get color => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            leading: Builder(
              builder: (BuildContext context) {
                return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    var top = constraints.biggest.height;
                    var showImage = top > 100;
                    return Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        if (showImage)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50.0), // Adjusted padding here
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 40.0,
                              height: 40.0,
                              margin: const EdgeInsets.only(left: 100),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/3611476.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            // Handle back button press
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            actions: [
              Builder(
                builder: (BuildContext context) {
                  return LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      var top = constraints.biggest.height;
                      var showShareIcon = top > 100;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              showShareIcon ? Icons.share : Icons.more_vert,
                              key: ValueKey<bool>(showShareIcon),
                            ),
                          ),
                          onPressed: () {
                            // Handle share or more_vert button press
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                var top = constraints.biggest.height;
                var imageSize = top > 100 ? 80.0 : 40.0;
                return Container(
                  color: top <= 100
                      ? const Color.fromARGB(255, 240, 22, 7)
                      : const Color.fromARGB(255, 192, 189, 189),
                  child: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.all(8.0),
                    title: Row(
                      children: [
                        if (top <= 100)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: imageSize,
                            height: imageSize,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/3611476.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        if (top <= 100) const SizedBox(width: 8),
                        if (top <= 100)
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: ' The Weekend\n ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                TextSpan(
                                  text: 'Community -  + 11K Members',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    background: Image.asset(
                      'assets/images/3611476.jpg', // Specify only height
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: ' The Weekend\n',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'Community -  + 11K Members',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share_outlined),
                      onPressed: () {
                        // Handle share button press
                      },
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              // Add more containers as needed
              Container(
                margin: const EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  children: [
                    ReadMoreText(
                      content,
                      trimMode: TrimMode.Line,
                      trimLines: 5,
                      colorClickableText: Colors.blue,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                        height: 16), // Space between text and buttons
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(5, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: const Text(
                                'Outdoor',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        '   Media, docs and links',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {
                        // Define your onPressed action here
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 11),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 11),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        height: 50,
                                        color: const Color.fromARGB(
                                            255, 231, 228, 228),
                                        child: Image.asset(
                                            'assets/images/3611476.jpg'),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        height: 50,
                                        color: const Color.fromARGB(
                                            255, 231, 229, 229),
                                        child: Image.asset(
                                            'assets/images/3611476.jpg'),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        height: 50,
                                        color: const Color.fromARGB(
                                            255, 245, 244, 244),
                                        child: Image.asset(
                                            'assets/images/3611476.jpg'),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        height: 50,
                                        color: Colors.white,
                                        child: Image.asset(
                                            'assets/images/3611476.jpg'),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        height: 50,
                                        color: Colors.white,
                                        child: Image.asset(
                                            'assets/images/3611476.jpg'),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        height: 50,
                                        color: Colors.white,
                                        child: Image.asset(
                                            'assets/images/3611476.jpg'),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        height: 50,
                                        color: Colors.white,
                                        child: Image.asset(
                                            'assets/images/3611476.jpg'),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        height: 50,
                                        color: Colors.white,
                                        child: Image.asset(
                                            'assets/images/3611476.jpg'),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        height: 50,
                                        color: Colors.white,
                                        child: Image.asset(
                                            'assets/images/3611476.jpg'),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        height: 50,
                                        color: Colors.white,
                                        child: Image.asset(
                                            'assets/images/3611476.jpg'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 250,
                color: Colors.white,
                padding: const EdgeInsets.all(16.0), // Add padding if needed
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            ' Mute notifications',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.toggle_off,
                            color: Color.fromARGB(255, 128, 124, 124),
                            size: 40,
                          ),
                          onPressed: () {
                            // Define your onPressed action here
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Define your onPressed action here
                          },
                        ),
                        const Expanded(
                          child: Text(
                            ' Clear chat',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.lock),
                          onPressed: () {
                            // Define your onPressed action here
                          },
                        ),
                        const Expanded(
                          child: Text(
                            ' Encryption',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.logout, color: Colors.red),
                          onPressed: () {
                            // Define your onPressed action here
                          },
                        ),
                        const Expanded(
                          child: Text(
                            ' Exit Community',
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_down, color: Colors.red),
                          onPressed: () {
                            // Define your onPressed action here
                          },
                        ),
                        const Expanded(
                          child: Text(
                            ' Report',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.all(10),
                        padding:
                            const EdgeInsets.all(16.0), // Add padding if needed
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    ' Members',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                IconButton(
                                  iconSize: 25,
                                  icon: const Icon(
                                    Icons.search,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _showSearchBox = !_showSearchBox;
                                    });
                                  },
                                ),
                              ],
                            ),
                            if (_showSearchBox)
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search members...',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (2).jpg'),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akhila',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '25, Indian',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Define onPressed action here
                                    },
                                    style: ButtonStyle(
                                      padding: WidgetStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(20),
                                      ),
                                      shape: WidgetStateProperty.all<
                                          OutlinedBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Following',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
