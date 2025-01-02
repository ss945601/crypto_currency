import 'package:flutter/material.dart';

class LicenseAndDisclaimerPage extends StatelessWidget {
  const LicenseAndDisclaimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Software License and Disclaimer',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 16),

            // Version and Author
            const Text(
              'Version: 1.0',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Author: Chang Chin-Wei',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),

            // License Section
            _buildSectionTitle('License Terms (授權聲明)'),
            _buildBulletPoint('Usage Rights: You are granted a non-exclusive, non-transferable license to use this program.'),
            _buildBulletPoint('使用權限：您被授予非獨佔、不可轉讓的權利使用本程式。'),
            _buildBulletPoint('Copyright: This program and all related content are owned by the Developer (Chang Chin-Wei).'),
            _buildBulletPoint('版權聲明：本程式及其所有相關內容均屬於開發者 (Chang Chin-Wei) 所有。'),
            _buildBulletPoint('Restrictions: This program is for lawful purposes only.'),
            _buildBulletPoint('限制條款：本程式僅供合法用途。'),
            const SizedBox(height: 16),

            // Disclaimer Section
            _buildSectionTitle('Disclaimer (免責聲明)'),
            _buildBulletPoint('Loss Disclaimer: All data is for reference only and does not constitute investment advice.'),
            _buildBulletPoint('虧損免責聲明：所有數據僅供參考，不構成投資建議。'),
            _buildBulletPoint('No Warranty: This program is provided "as is," without any express or implied warranties.'),
            _buildBulletPoint('無保證聲明：本程式按「現狀」提供，無任何明示或暗示的保證。'),
            _buildBulletPoint('Legal Liability: Developer is not liable for any losses caused by the use of this program.'),
            _buildBulletPoint('法律責任：開發者對於因使用本程式所引起的任何損失概不負責。'),
            const SizedBox(height: 16),

            // Closing Note
            const Text(
              'By using this program, you agree to the above terms. If you have any questions, please contact the author (Chang Chin-Wei).',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '使用本程式即表示您同意上述條款。如有任何疑問，請聯繫作者 (Chang Chin-Wei)。',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}