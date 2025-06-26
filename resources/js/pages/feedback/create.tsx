import { useForm, Head } from '@inertiajs/react';
import React, { useState, useEffect } from 'react';
import { MessageCircle, Send, User, FileText, CheckCircle, X } from 'lucide-react';

export default function Create() {
  const { data, setData, post, processing, errors, wasSuccessful } = useForm({
    subject: '',
    content: '',
  });

  const [showNotification, setShowNotification] = useState(false);

  function submit(e: React.FormEvent) {
    e.preventDefault();
    post(route('feedback.store'));
  }

  useEffect(() => {
    if (wasSuccessful) {
      setShowNotification(true);
      const timer = setTimeout(() => {
        setShowNotification(false);
      }, 5000);

      return () => clearTimeout(timer);
    }
  }, [wasSuccessful]);

  return (
    <>
      <Head title="Send Feedback" />
      <div className="min-h-screen bg-background text-foreground py-12 px-4">
      {/* Notification */}
      {showNotification && (
        <div className="fixed top-4 right-4 z-50 animate-in slide-in-from-top-2 fade-in duration-300">
          <div className="bg-green-500 text-white px-6 py-4 rounded-lg shadow-lg flex items-center space-x-3 max-w-sm">
            <CheckCircle className="w-5 h-5 flex-shrink-0" />
            <div className="flex-1">
              <p className="font-semibold">Feedback Sent!</p>
              <p className="text-sm text-green-100">Thank you for your feedback.</p>
            </div>
            <button
              onClick={() => setShowNotification(false)}
              className="text-green-200 hover:text-white transition-colors"
            >
              <X className="w-4 h-4" />
            </button>
          </div>
        </div>
      )}

      <div className="max-w-2xl mx-auto">
        {/* Header */}
        <div className="text-center mb-12">
          <div className="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-r from-primary to-accent rounded-full mb-6 shadow-lg">
            <MessageCircle className="w-10 h-10 text-white" />
          </div>
          <h1 className="text-4xl font-bold mb-4">Share Your Feedback</h1>
          <p className="text-lg text-muted-foreground max-w-md mx-auto">
            Help us improve by sharing your thoughts, suggestions, or concerns with our team.
          </p>
        </div>

        {/* Form */}
        <div className="bg-card text-card-foreground rounded-2xl shadow-2xl border border-border overflow-hidden">
          <div className="bg-gradient-to-r from-primary to-accent px-8 py-6">
            <h2 className="text-2xl font-semibold text-primary-foreground flex items-center">
              <FileText className="w-6 h-6 mr-3" />
              Feedback Form
            </h2>
          </div>

          <div className="p-8 space-y-8">
            {/* Subject */}
            <div className="space-y-2">
              <label className="flex items-center text-sm font-semibold mb-3">
                <User className="w-4 h-4 mr-2 text-primary" />
                Subject
              </label>
              <div className="relative">
                <input
                  type="text"
                  value={data.subject}
                  onChange={e => setData('subject', e.target.value)}
                  placeholder="What's this feedback about?"
                  className={`w-full px-4 py-4 placeholder-muted-foreground text-foreground bg-card border-2 rounded-xl focus:outline-none focus:ring-4 transition-all duration-200 ${
                    errors.subject
                      ? 'border-destructive focus:border-destructive'
                      : 'border-border focus:border-primary hover:border-muted'
                  }`}
                />
                {errors.subject && (
                  <div className="absolute -bottom-6 left-0 text-destructive text-sm font-medium flex items-center">
                    <div className="w-2 h-2 bg-destructive rounded-full mr-2"></div>
                    {errors.subject}
                  </div>
                )}
              </div>
            </div>

            {/* Content */}
            <div className="space-y-2 mt-8">
              <label className="flex items-center text-sm font-semibold mb-3">
                <MessageCircle className="w-4 h-4 mr-2 text-primary" />
                Your Feedback
              </label>
              <div className="relative">
                <textarea
                  value={data.content}
                  onChange={e => setData('content', e.target.value)}
                  placeholder="Share your detailed feedback, suggestions, or concerns..."
                  rows={6}
                  className={`w-full px-4 py-4 placeholder-muted-foreground text-foreground bg-card border-2 rounded-xl focus:outline-none focus:ring-4 transition-all duration-200 resize-none ${
                    errors.content
                      ? 'border-destructive focus:border-destructive'
                      : 'border-border focus:border-primary hover:border-muted'
                  }`}
                />
                {errors.content && (
                  <div className="absolute -bottom-6 left-0 text-destructive text-sm font-medium flex items-center">
                    <div className="w-2 h-2 bg-destructive rounded-full mr-2"></div>
                    {errors.content}
                  </div>
                )}
              </div>
            </div>

            {/* Submit */}
            <div className="pt-6">
              <button
                type="submit"
                disabled={processing}
                onClick={submit}
                className={`w-full px-8 py-4 text-primary-foreground font-semibold rounded-xl transition-all duration-200 transform focus:outline-none focus:ring-4 focus:ring-primary/20 ${
                  processing
                    ? 'bg-muted cursor-not-allowed'
                    : 'bg-gradient-to-r from-primary to-accent hover:from-primary/90 hover:to-accent/90 hover:scale-105 active:scale-95 shadow-lg hover:shadow-xl'
                }`}
              >
                <div className="flex items-center justify-center">
                  {processing ? (
                    <>
                      <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white mr-3"></div>
                      Sending...
                    </>
                  ) : (
                    <>
                      <Send className="w-5 h-5 mr-3" />
                      Send Feedback
                    </>
                  )}
                </div>
              </button>
            </div>
          </div>
        </div>

        {/* Footer */}
        <div className="text-center mt-8">
          <p className="text-sm text-muted-foreground">
            Your feedback is valuable to us and helps improve our service. Thank you for taking the time to share your thoughts!
          </p>
        </div>
      </div>
    </div>
    </>
  );
}
